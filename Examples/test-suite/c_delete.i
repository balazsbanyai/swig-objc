%module c_delete

/* check C++ delete keyword is okay in C wrappers */

%warnfilter(SWIGWARN_PARSE_KEYWORD) delete;

#if !defined(SWIGOCTAVE) && !defined(SWIG_JAVASCRIPT_V8) && !defined(SWIGOBJECTIVEC)/* Octave, Javascript/v8 and Objective-C compiles wrappers as C++ */

%inline %{
struct delete {
  int delete;
};
%}

%rename(DeleteGlobalVariable) delete;
%inline %{
int delete = 0;
%}

#endif
