reset
set terminal epslatex color
set output 'Stickstofftemp.tex'
set xlabel 'Zeit $t$ [min]'
set ylabel 'Temperatur $T$ [$^\circ C$]'
set key top right

T(x)=0.219+20.456*x-0.302*x**2+0.009*x**3
U(x)=20.456-2*0.302*x+3*0.009*x**2
V=0.02#mV Unsicherheit

p 'StickstoffAlHeizen.dat' u 1:(T($2)):(U($2)*V) w e t'Aluminium',\
  'StickstoffBeHeizen.dat' u 1:(T($2)+T(0.88)):(U($2)*V) w e t'Beryllium',\
  'StickstoffAlKuehlen.dat' u ($1/2+15):(T($2)):(U($2)*V) w e pt 1 lt 1 notitle,\
  'StickstoffBeKuehlen.dat' u ($1+15):(T($2)+T(0.88)):(U($2)*V) w e pt 2 lt 2 notitle

set output
!epstopdf Stickstofftemp.eps
!rm Stickstofftemp.eps