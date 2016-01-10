#import "typedef_inherit_proxy.h"
#import <assert.h>

int main(int argc, char * argv[])
{
NSAutoreleasePool * pool =[[NSAutoreleasePool alloc]init];
Foo *foo =[[Foo alloc]init];
Bar *bar=[[Bar alloc]init];
NSString *t=ObjcDoBlah(foo);
assert([t isEqualToString:@"Foo::blah"]);
	
t=ObjcDoBlah(bar);
assert([t isEqualToString:@"Bar::blah"]);
 
Spam *spam=[[Spam alloc]init];
Grok *grok=[[Grok alloc]init];
 
t=ObjcDoBlah2(spam);
assert([t isEqualToString:@"Spam::blah"]);
 
t=ObjcDoBlah2(grok);
assert([t isEqualToString:@"Grok::blah"]);
	
[foo release];
[bar release];
[spam release];
[grok release];

[pool drain];
return 0;
}

