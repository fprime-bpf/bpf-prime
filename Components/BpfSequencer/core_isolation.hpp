// Excludes a CPU core from IRQ/workqueue scheduling, so a thread pinned there
// behaves deterministically.
#pragma once

#include <string>
#include <utility>
#include <vector>

namespace Components {

// Excludes `core` from every IRQ's affinity mask; returns the originals to restore.
std::vector<std::pair<std::string, std::string>> exclude_core_from_irqs(int core);

void restore_irq_affinities(const std::vector<std::pair<std::string, std::string>>& saved);

// Excludes `core` from the unbound-workqueue cpumask; returns the original to restore.
std::string exclude_core_from_workqueues(int core);

void restore_workqueue_affinity(const std::string& original);

}  // namespace Components
