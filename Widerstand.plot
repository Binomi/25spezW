reset
set terminal epslatex color
set output 'Widerstand_Raum.tex'
set xlabel 'Temperatur $T$ [$\si\kelvin$]'
set ylabel 'Widerstand $R$  [$\Omega$]'
set key top left

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3+273.15
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

p 'heizenAl.dat' u (T($2)):(3*(10.5+0.25*$0)/0.5):(1.2/0.5) w e t'Aluminium',\
  'heizenBe.dat' u (T($2)):(3*$3/0.5):(1.2/0.5) w e t'Beryllium'
  

set output
!epstopdf Widerstand_Raum.eps
!rm Widerstand_Raum.eps

#====================================================================

reset
set terminal epslatex color
set output 'Widerstand_Stick.tex'
set xlabel 'Temperatur $T$ [$\si\kelvin]'
set ylabel 'Widerstand $R$  [$\Omega$]'
set key top left

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3+273.15
T_alt(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

p 'stickstoffAlHeizen.dat' u (T($2)):($3/0.5):(0.4/0.5) w e t'Aluminium',\
  'stickstoffBeHeizen.dat' u (T($2)+T_alt(0.88)):($3/0.5):($4/0.5) w e t'Beryllium',\
  

set output
!epstopdf Widerstand_Stick.eps
!rm Widerstand_Stick.eps

#====================================================================

reset
set terminal epslatex color
set output 'Widerstand.tex'
set xlabel 'Temperatur $T$ [$\si\kelvin$]'
set ylabel 'Widerstand $R$  [$\Omega$]'
set key top left

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3+273.15
T_alt(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

p 'heizenAl.dat' u (T($2)):(3*(10.5+0.25*$0)/0.5):(1.2/0.5) w e t'Aluminium',\
  'heizenBe.dat' u (T($2)):(3*$3/0.5):(1.2/0.5) w e t'Beryllium',\
  'stickstoffAlHeizen.dat' u (T($2)):($3/0.5):(0.4/0.5) w e pt 1 lt 1 notitle,\
  'stickstoffBeHeizen.dat' u (T($2)+T_alt(0.88)):($3/0.5):($4/0.5) w e pt 2 lt 2 notitle,\
  

set output
!epstopdf Widerstand.eps
!rm Widerstand.eps

#====================================================================

reset
set terminal epslatex color
set output 'Widerstand2.tex'
set xlabel 'Temperatur $T$ [$\si\kelvin$]'
set ylabel 'Widerstand $R$  [$\Omega$]'
set key top left
set xrange [0:*]

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3+273.15
T_alt(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

set fit logfile 'Widerstand.log'

A(x)=a*x+b
C(x)=c*x+d
E(x)=e*x+f
G(x)=g*x+h

fit A(x) 'heizenAl.dat' u (T($2)):(3*(10.5+0.25*$0)/0.5):(1.2/0.5) via a,b
fit C(x) 'heizenBe.dat' u (T($2)):(3*$3/0.5):(1.2/0.5) via c,d
fit E(x) 'stickstoffAlHeizen.dat' u (T($2)):($3/0.5):(0.4/0.5) via e,f
fit G(x) 'stickstoffBeHeizen.dat' u (T($2)+T_alt(0.88)):($3/0.5):($4/0.5) via g,h

p 'heizenAl.dat' u (T($2)):(3*(10.5+0.25*$0)/0.5):(1.2/0.5) w e t'Aluminium',\
  'heizenBe.dat' u (T($2)):(3*$3/0.5):(1.2/0.5) w e t'Beryllium',\
  'stickstoffAlHeizen.dat' u (T($2)):($3/0.5):(0.4/0.5) w e pt 1 lt 1 notitle,\
  'stickstoffBeHeizen.dat' u (T($2)+T_alt(0.88)):($3/0.5):($4/0.5) w e pt 2 lt 2 notitle,\
  A(x) lt -1 notitle,\
  C(x) lt -1 notitle,\
  E(x) lt -1 notitle,\
  G(x) lt -1 notitle
  
set print 'widerstand_koeff.dat'
print a,a_err
print e,e_err
print c,c_err
print g,g_err

set print
  

set output
!epstopdf Widerstand2.eps
!rm Widerstand2.eps