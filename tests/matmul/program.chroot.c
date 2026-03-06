#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <sched.h>
#include <time.h>

#define MAT_DIM 10
#define MAT_SIZE (MAT_DIM * MAT_DIM)
#define PERIOD_NS 100000000L  // 100ms in nanoseconds

int main() {
    struct sched_param p;
    p.sched_priority = 20;
    if (sched_setscheduler(0, SCHED_RR, &p) != 0) {
        fprintf(stderr, "Warning: failed to set SCHED_RR priority: %s\n", strerror(errno));
    }

    while (1) {
        struct timespec start, now;
        clock_gettime(CLOCK_MONOTONIC, &start);

        float mat_1[MAT_SIZE], mat_2[MAT_SIZE], mat_res[MAT_SIZE];

        for (int i = 0; i < MAT_SIZE; i++) {
            mat_1[i] = (float)(rand() % 101);
            mat_2[i] = (float)(rand() % 101);
            mat_res[i] = 0.0f;
        }

        for (int i = 0; i < MAT_DIM * MAT_DIM * MAT_DIM; i++) {
            int row = i / (MAT_DIM * MAT_DIM);
            int col = (i / MAT_DIM) % MAT_DIM;
            int k = i % MAT_DIM;
            mat_res[row * MAT_DIM + col] += mat_1[row * MAT_DIM + k] * mat_2[k * MAT_DIM + col];
        }

        // Busy wait until 100ms have elapsed since start
        do {
            clock_gettime(CLOCK_MONOTONIC, &now);
        } while ((now.tv_sec - start.tv_sec) * 1000000000L + (now.tv_nsec - start.tv_nsec) < PERIOD_NS);
    }

    return 0;
}
