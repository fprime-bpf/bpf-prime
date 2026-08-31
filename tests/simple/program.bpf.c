/*
 * A long scalar-only loop for snapshot and resume testing.
 *
 * The volatile values force stack loads and stores.  They are integers, so
 * the live data stack contains no pointers to data-stack memory.
 */
int main()
{
	volatile unsigned long long value = 0x123456789abcdef0ULL;
	volatile unsigned int iteration = 0;

	while (iteration < 1000000U) {
		value = (value << 7) ^ (value >> 3) ^ iteration;
		++iteration;
	}
	return (int)value;
}
