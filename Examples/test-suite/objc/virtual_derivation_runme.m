#import "virtual_derivation_proxy.h"
#import <assert.h>
int main(int argc,char* argv[])
{
NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
A *a =[[A alloc]initWithA:5];
B *b =[[B alloc]initWithA:5];
assert ([b getA] != [b getB]);
NSLog(@"Something Wrong");
				
[a release];
[b release];
[pool drain];
return 0;
}