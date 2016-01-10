%module typemap_delete

%typemap(in) Rectv* (Rectv temp) {
  $1 = 0;
  will_not_compile
}

%typemap(in) Rectv*;

%inline %{
struct Rectv
{
  int val;
  Rectv(int v) : val(v) {}
};
%}
