#import "typedef_reference_proxy.h"
#import<assert.h>

int main(int argc,char* argv[])
{
NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
int *int2=ObjcCopyIntp(2);
assert(ObjcSomefunc(int2) ==2);
int *int3=ObjcCopyIntp(3);
assert(ObjcSomefunc(int3) ==3);
[pool drain];
return 0;
}

