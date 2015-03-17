reset
set terminal epslatex color
set output 'Leistung_Raum.tex'
set xlabel 'Temperatur $T$ [$\si{\kelvin}$]'
set ylabel 'Leistung $P$  [W]'
set key top left

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3+273.15
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
set xlabel 'Temperatur $T$ [$\si\kelvin$]'
set ylabel 'Leistung $P$  [W]'
set key top left

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3+273.15
T_alt(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

p 'stickstoffAlHeizen.dat' u (T($2)):($3*0.5):(0.4*0.5) w e t'Aluminium',\
  'stickstoffBeHeizen.dat' u (T($2)+T_alt(0.88)):($3*0.5):($4*0.5) w e t'Beryllium'
  

set output
!epstopdf Leistung_Stick.eps
!rm Leistung_Stick.eps

#======================================================================
reset
set terminal epslatex color
set output 'Leistung.tex'
set xlabel 'Temperatur $T$ [$\si\kelvin$]'
set ylabel 'Leistung $P$  [W]'
set key top left

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3+273.15
T_alt(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

p 'heizenAl.dat' u (T($2)):(3*(10.5+0.25*$0)*0.5):(1.2*0.5) w e t'Aluminium',\
  'heizenBe.dat' u (T($2)):(3*$3*0.5):(1.2*0.5) w e t'Beryllium',\
  'stickstoffAlHeizen.dat' u (T($2)):($3*0.5):(0.4*0.5) w e pt 1 lt 1 notitle,\
  'stickstoffBeHeizen.dat' u (T($2)+T_alt(0.88)):($3*0.5):($4*0.5) w e pt 2 lt 2 notitle
  

set output
!epstopdf Leistung.eps
!rm Leistung.eps
