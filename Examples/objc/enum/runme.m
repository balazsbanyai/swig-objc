
#import "example_proxy.h"

int main(int argc, char* argv[]) {
	// Print out the value of some enums
	NSLog(@"*** color ***");
 	NSLog(@"color::RED   = %li", RED);
 	NSLog(@"color::BLUE  = %li", BLUE);
	NSLog(@"color::GREEN = %li", GREEN);

 	NSLog(@"\n*** Foo::speed ***");
 	NSLog(@"speed::IMPULSE   = %li",Foo_IMPULSE);
 	NSLog(@"speed::WARP      = %li",Foo_WARP);
 	NSLog(@"speed::LUDICROUS = %li",Foo_LUDICROUS);

	NSLog(@"\nTesting use of enums with global function\n");
	ObjcEnumTest(RED,Foo_IMPULSE);
  	ObjcEnumTest(BLUE,Foo_WARP);
  	ObjcEnumTest(GREEN,Foo_LUDICROUS);
   
  	NSLog(@"\nTesting use of enum with class method" );
  	Foo* f = [[Foo alloc] init];

  	[f enumTestWithS:Foo_IMPULSE];
  	[f enumTestWithS:Foo_WARP];
  	[f enumTestWithS:Foo_LUDICROUS];
        [f release];
	
       return 0;
}
