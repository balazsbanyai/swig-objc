#import "integers_proxy.h"
#import <assert.h>

int main(int argc,char* argv[])
{
NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];

assert(ObjcSignedCharIdentity(-3)   == -3);
assert(ObjcUnsignedCharIdentity(5)  == 5);
assert(ObjcSignedShortIdentity(-3)  == -3);
assert(ObjcUnsignedShortIdentity(5) == 5);
assert(ObjcSignedIntIdentity(-3)  == -3);
assert(ObjcUnsignedIntIdentity(5) == 5);
assert(ObjcSignedLongIdentity(-3)  == -3);
assert(ObjcUnsignedLongIdentity(5) == 5);
assert(ObjcSignedLongLongIdentity(-3)  == -3);
assert(ObjcUnsignedLongLongIdentity(5) == 5);

[pool drain];
return 0;
}
