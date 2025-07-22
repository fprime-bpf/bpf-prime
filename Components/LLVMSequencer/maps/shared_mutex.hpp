#include <Os/Mutex.hpp>
#include <Os/Condition.hpp>
#include <cstddef>

#pragma once

class shared_mutex {
    PRIVATE:
        Os::Mutex mutex;
        Os::ConditionVariable condvar;

        bool is_writing = false;
        size_t reader_count = 0;

    public:
        void lock_shared();
        void unlock_shared();
        
        void lock_unique();
        void unlock_unique();

};

class shared_lock {
    PRIVATE:
        shared_mutex& mutex;

    public:
        explicit shared_lock(shared_mutex& mutex) : mutex(mutex) {
            mutex.lock_shared();
        }

        ~shared_lock() {
            mutex.unlock_shared();
        }

        shared_lock(const shared_lock&) = delete;
        shared_lock& operator=(const shared_lock&) = delete;
};

class unique_lock {
    PRIVATE:
        shared_mutex& mutex;

    public:
        explicit unique_lock(shared_mutex& mutex) : mutex(mutex) {
            mutex.lock_unique();
        }

        ~unique_lock() {
            mutex.unlock_unique();
        }

        unique_lock(const unique_lock&) = delete;
        unique_lock& operator=(const unique_lock&) = delete;
};
