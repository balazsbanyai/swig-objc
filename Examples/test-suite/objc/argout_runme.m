#import "argout_proxy.h"
#import <assert.h>

int main(int argc,char* argv[])
{
NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
int *int1=ObjcCopyIntp(42);
assert(ObjcIncp(int1) == 42);
assert(ObjcIntpValue(int1) ==43);

int *int2=ObjcCopyIntp(2);
assert(ObjcIncp(int2) == 2);
assert(ObjcIntpValue(int2) ==3);

int *int3=ObjcCopyIntp(7);
assert(ObjcIncp(int3) == 7);
assert(ObjcIntpValue(int3) ==8);

int *int4=ObjcCopyIntp(4);
assert(ObjcIncp(int4) == 4);
assert(ObjcIntpValue(int4) ==5);

[pool drain];
return 0;
}

