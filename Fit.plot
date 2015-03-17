reset

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3+273.15
T_alt(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

T0=T(0.88)
T1=109.889
T2=105.978
TN=-190+273.15

A(x)=a*x+b
C(x)=c*x+d
E(x)=e*x+f
G(x)=g*x+h
I(x)=i*x+j
K(x)=k*x+l
M(x)=m*x+n
O(x)=o*x+p

set fit errorvariables

fit A(x) 'heizenAl.dat' u ($1*60):(T($2)*1000):(U($2)*V*1000) via a,b
fit C(x) 'heizenBe.dat' u ($1*60):(T($2)*1000):(U($2)*V*1000) via c,d
fit E(x) 'kuehlenAl.dat' u ($1*60):(log(T($2)-T0)*10**5):(U($2)*V/(T($2)-T0)*10**5) via e,f
fit G(x) 'kuehlenBe.dat' u ($1*60):(log(T($2)-T0)*10**5):(U($2)*V/(T($2)+T_alt(0.88)-T0)*10**5) via g,h

fit I(x) 'stickstoffAlHeizen.dat' u ($1*60):(T($2)*1000):(U($2)*V*1000) via i,j
fit K(x) 'stickstoffBeHeizen.dat' u ($1*60):(T($2)*1000):(U($2)*V*1000) via k,l
fit M(x) 'stickstoffAlKuehlen.dat' u ($1*30):(log(T($2)-T1)*10**5):(U($2)*V/(T($2)-T1)*10**5) via m,n
fit O(x) 'stickstoffBeKuehlen.dat' u ($1*60):(log(T($2)+T_alt(0.88)-T2)*10**5):(U($2)*V/(T($2)+T_alt(0.88)-T1)*10**5) via o,p

set print 'temp_fit.dat'
print a,a_err,e,e_err
print c,c_err,g,g_err

print i,i_err,m,m_err
print k,k_err,o,o_err

set print
