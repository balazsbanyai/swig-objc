#ifndef CLIENTDATA_PROP_A_H
#define CLIENTDATA_PROP_A_H

class A {
  public:
    void fA() {}
};

typedef A tA;

void test_A(A *a) {}
void test_tA(tA *a) {}

tA *new_tA() { return new tA(); }

#endif
