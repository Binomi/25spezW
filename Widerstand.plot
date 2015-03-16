reset
set terminal epslatex color
set output 'Widerstand_Raum.tex'
set xlabel 'Temperatur $T$ [$\si{\celsius}$]'
set ylabel 'Widerstand $R$  [$\Omega$]'
set key top left

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
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
set xlabel 'Temperatur $T$ [$^\circ C$]'
set ylabel 'Widerstand $R$  [$\Omega$]'
set key top left

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

p 'stickstoffAlHeizen.dat' u (T($2)):($3/0.5):(0.4/0.5) w e t'Aluminium',\
  'stickstoffBeHeizen.dat' u (T($2)+T(0.88)):($3/0.5):($4/0.5) w e t'Beryllium',\
  

set output
!epstopdf Widerstand_Stick.eps
!rm Widerstand_Stick.eps
