#import "constover_proxy.h"
#import <assert.h>

int main(int argc ,char *argv[ ])
{
NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
NSString *p1;
p1=ObjcTest(@"test");
assert([p1 isEqualToString:@"test"]);
p1=ObjcTestPconst(@"test_pconst");
assert([p1 isEqualToString:@"test_pconst"]);	
			 
Foo *foo =[[Foo alloc]init];
p1 =[foo testWithX:@"test"];
assert([p1 isEqualToString:@"test"]);

p1 =[foo testPconstWithX:@"test_pconst"];
assert([p1 isEqualToString:@"test_pconst"]);
				 
p1 =[foo testPconstmWithX:@"test_pconstmethod"];
assert([p1 isEqualToString:@"test_pconstmethod"]);
	
	
[foo release];
[pool drain];
return 0;

}
