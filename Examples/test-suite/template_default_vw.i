%module template_default_vw

%inline %{
class SomeClass{ }; 
 
template<class T>  
class Handler { 
public: 
    Handler( T* t=0 ) { };   
    // ... 
}; 
 
typedef Handler<SomeClass> hSomeClass; 
class AnotherClass { 
public: 
  void someFunc( hSomeClass a = hSomeClass() ) { }; 
}; 

%}

%template() Handler<SomeClass>;



