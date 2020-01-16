#0: +*eDP-1 2560/309x1440/174+1920+0  eDP-1
#1: +HDMI-1 1920/509x1080/286+0+0  HDMI-1



M1="eDP-1"
X1=2560
Y1=1440
S1=1

M2="HDMI-1"
X2=1920
Y2=1080
S2=1.5


PAR_FD=`awk "BEGIN {printf \"%.0fx%0.f\", $X1*$S1+$X2*$S2,$Y1*$S1+$Y2*$S2}"`
PAR_PAN=`awk "BEGIN {printf \"%.0fx%0.f+%.0f+%.0f\", $X1*$S1+$X2*$S2, $X2*$S2+$Y2*$S2,$X1*$S1,0}"`
PAR_POS2=`awk "BEGIN {printf \"%.0fx%0.f\", 0,$Y2*$S2}"`
#xrandr --dpi 276 --fb $PAR_FD \
#       --output $M1 --mode ${X1}x${Y1} \
#       --output $M2 --scale ${S2}x${S2} --pos ${X1}x0

#xrandr --dpi 276 --fb 2880x3240 \
#       --output $M1 --mode ${X1}x${Y1} \
#       --output $M2 --scale ${S2}x${S2} --pos $PAR_POS2

xrandr --dpi 276 --fb 2880x3240 \
       --output $M1 --mode ${X1}x${Y1} --pos $PAR_POS2\
       --output $M2 --scale ${S2}x${S2} 
#--panning $PAR_PAN"
