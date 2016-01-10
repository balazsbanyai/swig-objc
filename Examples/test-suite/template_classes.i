/* File : template_classes.i */
/* Tests the use of one templated class within another */

%module template_classes

%inline %{

template <class T>
class xPoint {
public:
  T getX() {return x;}
private:
  T x;
};

template <class T>
class RectangleTest {
public:
  xPoint<T>& getPoint() {return point;}
  void setPoint(xPoint<T>& value) {point = value;}

  static int static_noargs() { return 0; }
  static int static_onearg(int i) { return i; }
private:
  xPoint<T> point;

  template <class Data>
  struct pair2nd_eq
  {
  };

  struct Foo : xPoint<int>
  {
  };
  
  Foo foo;
};

%}

%template(PointInt) xPoint<int>;
%template(RectangleInt) RectangleTest<int>;

