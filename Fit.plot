reset

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

A(x)=a*x+b
C(x)=c*x+d
E(x)=e*x+f
G(x)=g*x+h
I(x)=i*x+j
K(x)=k*x+l
M(x)=m*x+n
O(x)=o*x+p

set fit errorvariables

fit A(x) 'heizenAl.dat' u 1:(T($2)):(U($2)*V) via a,b
fit C(x) 'heizenBe.dat' u 1:(T($2)):(U($2)*V) via c,d
fit E(x) 'kuehlenAl.dat' u 1:(log(T($2))):(U($2)*V/T($2)) via e,f
fit G(x) 'kuehlenBe.dat' u 1:(log(T($2))):(U($2)*V/T($2)) via g,h

fit I(x) 'StickstoffAlHeizen.dat' u 1:(T($2)):(U($2)*V) via i,j
fit K(x) 'StickstoffBeHeizen.dat' u 1:(T($2)):(U($2)*V) via k,l
fit M(x) 'StickstoffAlKuehlen.dat' u 1:(log(T($2))):(U($2)*V/T($2)) via m,n
fit O(x) 'StickstoffBeKuehlen.dat' u 1:(log(T($2))):(U($2)*V/T($2)) via o,p

set print 'temp_fit.dat'
print a,a_err,b,b_err
print c,c_err,d,d_err
print e,e_err,f,f_err
print g,g_err,h,h_err

print i,i_err,j,j_err
print k,k_err,l,l_err
print m,m_err,n,n_err
print o,o_err,p,p_err

set print

stats 'heizenAl.dat' u 1:(T($2))
stats 'heizenBe.dat' u 1:(T($2))
stats 'kuehlenAl.dat' u 1:(log(T($2)))
stats 'kuehlenBe.dat' u 1:(log(T($2)))

stats 'StickstoffAlHeizen.dat' u 1:(T($2))
stats 'StickstoffBeHeizen.dat' u 1:(T($2))
stats 'StickstoffAlKuehlen.dat' u 1:(log(T($2)))
stats 'StickstoffBeKuehlen.dat' u 1:(log(T($2)))