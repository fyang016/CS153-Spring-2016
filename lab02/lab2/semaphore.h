
struct Semaphore{
	uint counter;
	struct proc holders[10];
};

