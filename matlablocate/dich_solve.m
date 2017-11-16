function x=dich_solve(myequ,a,b)
if b-a<=10^(-10)
    x=(a+b)/2;
elseif myequ((a+b)/2)==0
    x=(a+b)/2;
elseif myequ(a)==0
    x=a;
elseif myequ(b)==0
    x=b;
elseif myequ((a+b)/2)*myequ(a)<0
    x=dich_solve(myequ,a,(a+b)/2);
elseif myequ((a+b)/2)*myequ(b)<0
    x=dich_solve(myequ,(a+b)/2,b);
end