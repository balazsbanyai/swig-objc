#import "cpp_static_proxy.h"
#import<assert.h>

int main(int argc,char* argv[])
{
NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
[StaticMemberTest setStaticInt:3];
assert([StaticMemberTest getStaticInt] ==3);
[StaticFunctionTest staticFunc2WithParam1:5];
[StaticFunctionTest staticFunc3WithParam1:5 param2:10];
[pool drain];
return 0;
}
