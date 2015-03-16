reset
set terminal epslatex color
set output 'waerme.tex'
set xlabel 'Temperatur $T$ [K]'
set ylabel 'molare Wärmekapatität $c_m$  [$\si[per-mode=fraction]{\joule\per\kelvin\per\mol}$]'
set key bottom right

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3+273.15
T_alt(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

R=8.314
D(x)=3*R

Al_m=52.5#g
Al_M=26.982#g/mol
Be_m=43#g
Be_M=9.012#g/mol

Al_a=		302.878362639521*10**-3
Al_a_err=	2.09065030823506*10**-3
Al_l=		11.6071512135173*10**-5
Al_l_err=	0.23542624273917*10**-5

Be_a=		188.465552405985*10**-3
Be_a_err=	1.1076603258968*10**-3
Be_l=		7.60900764467717*10**-5
Be_l_err=	0.130257483295358*10**-5

N_Al_a=		74.8459733770442*10**-3
N_Al_a_err=	0.221944487154329*10**-3
N_Al_l=		45.5222827014969*10**-5
N_Al_l_err=	0.991348975682923*10**-5

N_Be_a=		108.779691258308*10**-3
N_Be_a_err=	3.11013018634609*10**-3
N_Be_l=		60.4841519341712*10**-5
N_Be_l_err=	0.170079159068711*10**-5

c(x)=12*pi**4/5*R*(x/1481)**3


p 'heizenAl.dat' u (T($2)):(3*(10.5+0.25*$0)*0.5/(Al_m*(Al_a+Al_l*T($2)))*Al_M):(Al_M/Al_m*sqrt((1.2*0.5/(Al_a+Al_l*T($2)))**2+(3*(10.5+0.25*$0)*0.5/(Al_a+Al_l*T($2)))**2*(Al_a_err**2+(T($2)*Al_l_err)**2+(Al_l*U($2)*V)**2))) w e t'Aluminium',\
  'heizenBe.dat' u (T($2)):(3*$3*0.5/(Be_m*(Be_a+Be_l*T($2)))*Be_M):(Be_M/Be_m*sqrt((1.2*0.5/(Be_a+Be_l*T($2)))**2+(3*$3*0.5/(Be_a+Be_l*T($2)))**2*(Be_a_err**2+(T($2)*Be_l_err)**2+(Be_l*U($2)*V)**2))) w e t'Beryllium',\
  'stickstoffAlHeizen.dat' u (T($2)):($3*0.5/(Al_m*(N_Al_a+N_Al_l*T($2)))*Al_M):(Al_M/Al_m*sqrt((0.4*0.5/(N_Al_a+N_Al_l*T($2)))**2+($3*0.5/(N_Al_a+N_Al_l*T($2)))**2*(N_Al_a_err**2+(T($2)*N_Al_l_err)**2+(N_Al_l*U($2)*V)**2))) w e pt 1 lt 1 notitle,\
  'stickstoffBeHeizen.dat' u (T($2)+T_alt(0.88)):($3*0.5/(Be_m*(N_Be_a+N_Be_l*(T($2)+T_alt(0.88))))*Be_M):(Be_M/Be_m*sqrt(($4*0.5/(N_Be_a+N_Be_l*(T($2)+T_alt(0.88)))**2+($3*0.5/(N_Be_a+N_Be_l*(T($2)+T_alt(0.88))))**2*(N_Be_a_err**2+((T($2)+T_alt(0.88))*N_Be_l_err)**2+(N_Be_l*U($2)*V)**2)))) w e pt 2 lt 2 notitle,\
  D(x) lt -1 t 'Dulong-Petit-Wert'#,[x=*:200] c(x)
  
#:(1.2*0.5) w e
#:($4*0.5) w e

set output
!epstopdf waerme.eps
!rm waerme.eps
