reset
set terminal epslatex color
set output 'Leistung_Raum.tex'
set xlabel 'Temperatur $T$ [$^\circ C$]'
set ylabel 'Leistung $P$  [W]'
set key top left

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

p 'heizenAl.dat' u (T($2)):(3*(10.5+0.25*$0)*0.5):(1.2*0.5) w e t'Aluminium',\
  'heizenBe.dat' u (T($2)):(3*$3*0.5):(1.2*0.5) w e t'Beryllium'
  

set output
!epstopdf Leistung_Raum.eps
!rm Leistung_Raum.eps

#====================================================================

reset
set terminal epslatex color
set output 'Leistung_Stick.tex'
set xlabel 'Temperatur $T$ [$^\circ C$]'
set ylabel 'Leistung $P$  [W]'
set key top left

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

p 'StickstoffAlHeizen.dat' u (T($2)):($3*0.5):(1.2*0.5) w e t'Aluminium',\
  'StickstoffBeHeizen.dat' u (T($2)+T(0.88)):($3*0.5):($4*0.5) w e t'Beryllium',\
  

set output
!epstopdf Leistung_Stick.eps
!rm Leistung_Stick.eps



set terminal windows
replot