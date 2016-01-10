#import "template_inherit_proxy.h"
#import <assert.h>
int main(int argc, char *argv[])
{
NSAutoreleasePool *pool =[[NSAutoreleasePool alloc]init];
FooInt *a = [[FooInt alloc]init];
FooDouble *b = [[FooDouble alloc]init];
BarInt *c = [[BarInt alloc]init];
BarDouble *d = [[BarDouble alloc]init];
FooUInt *e = [[FooUInt alloc]init];
BarUInt *f = [[BarUInt alloc]init];

NSString *t=[a blah];
assert([t isEqualToString:@"Foo"]); 

t=[b blah];
assert([t isEqualToString:@"Foo"]); 

t=[e blah];
assert([t isEqualToString:@"Foo"]); 
	
t=[c blah];
assert([t isEqualToString:@"Bar"]); 

t=[d blah];
assert([t isEqualToString:@"Bar"]); 

t=[f blah];
assert([t isEqualToString:@"Bar"]); 

t=[c foomethod];
assert([t isEqualToString:@"foomethod"]); 

t=[d foomethod];
assert([t isEqualToString:@"foomethod"]); 
	
t=[f foomethod];
assert([t isEqualToString:@"foomethod"]); 

t=ObjcInvokeBlahInt(a);
assert([t isEqualToString:@"Foo"]); 
	
t=ObjcInvokeBlahInt(c);
assert([t isEqualToString:@"Bar"]); 

t=ObjcInvokeBlahDouble(b);
assert([t isEqualToString:@"Foo"]); 

t=ObjcInvokeBlahDouble(d);
assert([t isEqualToString:@"Bar"]); 

t=ObjcInvokeBlahUint(e);
assert([t isEqualToString:@"Foo"]); 
	
t=ObjcInvokeBlahUint(f);
assert([t isEqualToString:@"Bar"]); 

[a release];
[b release];
[c release];
[d release];
[e release];
[f release];

[pool drain];
	
return 0;
}
