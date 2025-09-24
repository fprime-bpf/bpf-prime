#include "shared_mutex.hpp"
#include <Os/Mutex.hpp>
#include <Os/Condition.hpp>

void shared_mutex::lock_shared() {
    mutex.lock();

    while (is_writing) {
        condvar.wait(mutex);
    }
    reader_count++;

    mutex.unlock();
}

void shared_mutex::unlock_shared() {
    mutex.lock();

    reader_count--;
    if (reader_count == 0) {
        condvar.notifyAll();
    }

    mutex.unlock();
}

void shared_mutex::lock_unique() {
    mutex.lock();

    while (is_writing || reader_count > 0) {
        condvar.wait(mutex);
    }
    is_writing = true;

    mutex.unlock();
}

void shared_mutex::unlock_unique() {
    mutex.lock();
    
    is_writing = false;
    condvar.notifyAll();

    mutex.unlock();
}