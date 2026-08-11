#include "Components/BpfSequencer/core_isolation.hpp"

#include <algorithm>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <sstream>

namespace Components {

std::vector<std::pair<std::string, std::string>> exclude_core_from_irqs(int core) {
    std::vector<std::pair<std::string, std::string>> saved;

    std::error_code ec;
    for (const auto& entry : std::filesystem::directory_iterator("/proc/irq", ec)) {
        if (!entry.is_directory())
            continue;

        auto list_path = entry.path() / "smp_affinity_list";

        std::string current;
        {
            std::ifstream in(list_path);
            if (!in || !std::getline(in, current))
                continue;
        }

        std::vector<int> cpus;
        std::stringstream ss(current);
        std::string part;
        while (std::getline(ss, part, ',')) {
            auto dash = part.find('-');
            if (dash != std::string::npos) {
                for (int c = std::stoi(part.substr(0, dash)); c <= std::stoi(part.substr(dash + 1)); c++)
                    cpus.push_back(c);
            } else if (!part.empty()) {
                cpus.push_back(std::stoi(part));
            }
        }

        if (std::find(cpus.begin(), cpus.end(), core) == cpus.end())
            continue;  // core isn't in this IRQ's mask

        cpus.erase(std::remove(cpus.begin(), cpus.end(), core), cpus.end());
        if (cpus.empty())
            continue;  // only affine to this core -- leave it alone

        std::ostringstream new_list;
        for (size_t i = 0; i < cpus.size(); i++) {
            if (i)
                new_list << ',';
            new_list << cpus[i];
        }

        std::ofstream out(list_path);
        if (out << new_list.str())
            saved.emplace_back(list_path.string(), current);
    }

    return saved;
}

void restore_irq_affinities(const std::vector<std::pair<std::string, std::string>>& saved) {
    for (const auto& [path, original] : saved) {
        std::ofstream(path) << original;
    }
}

std::string exclude_core_from_workqueues(int core) {
    static const char* const path = "/sys/devices/virtual/workqueue/cpumask";

    std::string current;
    {
        std::ifstream in(path);
        if (!in || !std::getline(in, current))
            return "";
    }

    std::vector<std::string> groups;
    std::stringstream ss(current);
    std::string group;
    while (std::getline(ss, group, ','))
        groups.push_back(group);

    if (groups.empty())
        return "";

    // groups[0] is the most-significant word (highest-numbered cores); the
    // word containing `core` is counted from the end of the list.
    size_t word_from_end = static_cast<size_t>(core) / 32;
    if (word_from_end >= groups.size())
        return "";  // core is out of range of the reported mask

    size_t idx = groups.size() - 1 - word_from_end;
    unsigned long word = std::stoul(groups[idx], nullptr, 16);
    word &= ~(1UL << (core % 32));

    std::ostringstream new_word;
    new_word << std::hex << std::setw(static_cast<int>(groups[idx].size())) << std::setfill('0') << word;
    groups[idx] = new_word.str();

    std::ostringstream new_mask;
    for (size_t i = 0; i < groups.size(); i++) {
        if (i)
            new_mask << ',';
        new_mask << groups[i];
    }

    std::ofstream out(path);
    if (!(out << new_mask.str()))
        return "";

    return current;
}

void restore_workqueue_affinity(const std::string& original) {
    if (original.empty())
        return;
    std::ofstream("/sys/devices/virtual/workqueue/cpumask") << original;
}

std::string read_rcu_stall_suppress() {
    std::ifstream in("/sys/module/rcupdate/parameters/rcu_cpu_stall_suppress");
    std::string val;
    std::getline(in, val);
    return val;
}

void write_rcu_stall_suppress(const std::string& val) {
    std::ofstream("/sys/module/rcupdate/parameters/rcu_cpu_stall_suppress") << val;
}

}  // namespace Components
