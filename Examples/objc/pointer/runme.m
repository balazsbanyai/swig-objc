
#import "example_proxy.h"

int main(int argc, char* argv[]) {
	
NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];

    // First create some objects using the pointer library.
    NSLog(@"Testing the pointer library");
    int* a = ObjcNewIntp();
    int* b = ObjcNewIntp();
    int* c = ObjcNewIntp();
    ObjcIntpAssign(a,37);
    ObjcIntpAssign(b,42);
    
    // Note that getCPtr() has package access by default
    NSLog(@"     a =%p",a );
    NSLog(@"     b =%p",b);
    NSLog(@"     c =%p",c);
    
    // Call the add() function with some pointers
    ObjcAdd(a,b,c);
    
    // Now get the result
    int res = ObjcIntpValue(c);
    NSLog(@"     37 + 42 = %d", res);
    
    // Clean up the pointers
    ObjcDeleteIntp(a);
    ObjcDeleteIntp(b);
    ObjcDeleteIntp(c);
    
    // Now try the typemap library
    // Now it is no longer necessary to manufacture pointers.
   // Instead we use a single element array which in Java is modifiable.
    
    NSLog(@"Trying the typemap library");
    int r[] = {0};
    ObjcSub(37,42,r);
    NSLog(@"     37 - 42 = %d", r[0]);
    
    // Now try the version with return value
    
    NSLog(@"Testing return value");
    int q = ObjcDivide(42,37,r);
    NSLog(@"     42/37 =%d and remainder=%d", q, r[0]);
    [pool drain];
     return 0;
}
