#import <Foundation/Foundation.h>

#include <pthread.h>

@interface Atomic: NSObject

@property (atomic) int sum;

@end

@interface NonAtomic: NSObject

@property (nonatomic) int sum;

@end

@implementation Atomic

@end

@implementation NonAtomic

@end

Atomic *a;
NonAtomic *na;

void *addHundred()
{
    for (int i = 0; i < 100; i++) {
        a.sum += i;
    }

    for (int i = 0; i < 100; i++) {
        na.sum += i;
    }
    pthread_exit(NULL);
}

int main()
{
    a = [[Atomic alloc] init];
    na = [[NonAtomic alloc] init];
    pthread_t t1;
    pthread_t t2;
    pthread_t t3;
    pthread_t t4;

    pthread_create(&t1, NULL, addHundred, NULL);
    pthread_create(&t2, NULL, addHundred, NULL);
    pthread_create(&t3, NULL, addHundred, NULL);
    pthread_create(&t4, NULL, addHundred, NULL);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
    pthread_join(t3, NULL);
    pthread_join(t4, NULL);

    NSLog(@"[ATOMIC]: %i", a.sum);
    NSLog(@"[NON-ATOMIC]: %i", na.sum);

    return 0;
}
