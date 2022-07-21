#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Felix Mueller");
MODULE_DESCRIPTION("lkm_crpi");
MODULE_VERSION("0.01");

#define TAU_PAGE_SIZE 4096
#define TAU_NUM_PAGES 8
#define TAU_CACHELINE_SIZE 64

static inline uint64_t read_pmccntr(void);
int determineL1Miss(unsigned long accesTime);
static int __init lkm_example_init(void);
static void __exit lkm_example_exit(void);

static inline uint64_t read_pmccntr(void)
{
	unsigned long val;
	asm volatile("mrs %0, pmccntr_el0" : "=r"(val));
	return val;
}

int determineL1Miss(unsigned long accesTime){
	return (accesTime > 15) ? 1 : 0;
}

static int __init lkm_example_init(void)
{
	unsigned long* ptr;	// holds actual accesed cache line
	unsigned long ptr_l;	// used to compute next memory cell to acces  
	unsigned long* ptr_s;	// holds start of allocated memory area 
	
	unsigned long* ptrs[5]; // holds address of i-th cache line in cache set
	register unsigned long* ptr_m;	// address of cache line to measure

	register unsigned long testvalue;	// variable to make gcc think we use the read value
	// 'register' is used to force load from memory to register: gcc uses 'register' as hint,
	// check asm-file to be sure no other then the memory to cpu operation is measured
	
	int i;
	
	register unsigned long start;	// measure cycles
	// 'register' is used to avoid occurance of another unwanted cache miss while storing measurement values
	unsigned long dur;
	
	
	printk(KERN_INFO "Starting lkm_crpi!\n");
	
	ptr	= (unsigned long*) __get_free_pages(GFP_KERNEL, 3);
	ptr_s	= ptr;
	ptr_l	= (unsigned long) ptr;
	
	i = 0;
	while(i<5)
	{
		*(ptr + 512*i) = ptr_l + (i+1)*4096;
	
		ptrs[i] = (unsigned long*)(ptr_l + (i)*4096);
	
		if(i==4)
		{
		*(ptr + 512*i) = 0;	//last address must be NULL to avoid walking past the defined sequence
		}
		printk(KERN_INFO "pointer: %p, next pointer: %p\n", (ptr+512*i), (void*)*(ptr+512*i));
		//make gcc assume we need access to these memory cells to avoid its elimination
		
		i++;
	}
	
	
	//measure the i-th cache line
	i=0;
	while(i<5)
	{	
		ptr_m = ptrs[i];
		ptr = ptr_s;
		while(ptr != 0)
		{
			testvalue = *ptr;
			printk(KERN_INFO "testvalue: %lu\n", testvalue);
			//make gcc assume we need access to these memory cells to avoid its elimination
			
			ptr = (unsigned long*) *ptr;
		}
	
		start = read_pmccntr();
		testvalue = *ptr_m;
		dur = read_pmccntr() - start;
		
		printk(KERN_INFO "%d acces value: %lu %d (%ld)\n",i, testvalue, determineL1Miss(dur), dur);
		printk(KERN_INFO "--------\n");
		
		i++;
	}
	
	//free memory
	free_pages((unsigned long)ptr_s, 3);
	
	return 0;
}

static void __exit lkm_example_exit(void)
{
	printk(KERN_INFO "Stopping lkm_crpi!\n");
}

module_init(lkm_example_init);
module_exit(lkm_example_exit);
