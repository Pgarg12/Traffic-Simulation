$Title  A Transportation Problem (TRNSPORT,SEQ=1)
  Sets
       i   supply   /1*2/
       j   demand   /1*2/ ;

 Parameters a(i)
/
 1 150
 2 150
/;

 Parameters b(j)
/
1 100
2 200
/;


Parameter c(i,j)
/
1.1 2
1.2 3
2.1 5
2.2 2
/;

  Variables
       x(i,j)  the passengers traveling from city i to airport j
       z       total transportation costs in thousands of dollars ;

  Positive Variable x ;

  Equations
       cost        define objective function
       supply(i)   observe supply limit at plant i
       demand(j)   satisfy demand at market j ;

  cost ..        z  =e=  sum((i,j), c(i,j)*x(i,j)) ;
  supply(i) ..   sum(j, x(i,j))  =e=  a(i) ;
  demand(j) ..   sum(i, x(i,j))  =e=  b(j) ;

  Model transport /all/ ;

  Solve transport using lp minimizing z ;

  Display x.l, z.l,  supply.m, demand.m;