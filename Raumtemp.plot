reset
set terminal epslatex color
set output 'Raumtemp.tex'
set xlabel 'Zeit $t$ [min]'
set ylabel 'Temperatur $T$ [$^\circ C$]'
set key top right

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

p 'heizenAl.dat' u 1:(T($2)):(U($2)*V) w e t'Aluminium',\
  'heizenBe.dat' u 1:(T($2)):(U($2)*V) w e t'Beryllium',\
  'kuehlenAl.dat' u ($1+3):(T($2)):(U($2)*V) w e pt 1 lt 1 notitle,\
  'kuehlenBe.dat' u ($1+5.5):(T($2)):(U($2)*V) w e pt 2 lt 2 notitle

set output
!epstopdf Raumtemp.eps
!rm Raumtemp.eps