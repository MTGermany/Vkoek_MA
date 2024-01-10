
# Value of time as a marginal consideration between
# fuel cost increase and time savings at constant speed

g=9.81              # [m/s^2]

P0ICE=2500.            #[W]
P0BEV=1200.
mu=0.015
m=1600.             # [kg]
cw=0.30
A=2.1                # [m^2]
rhoL=1.3            # [kg/m^3]

#cSpec(v)=0.25*(1+5/(v+5)) # [liter/kWh] (at higher speed, ICE more efficient)
cSpec(v)=0.28 # [liter/kWh] (at higher speed, ICE more efficient)
Pf=2.                 # [Euro/liter]

# Energy in kWh/100 km

E100(P0,v)=1e5*(P0/v+mu*m*g+0.5*cw*rhoL*A*v**2)/(3.6e6)

# consumption in liter/100 km

C100(P0,v)=cSpec(v)*E100(P0,v)

# VOT in Euro/hour

VOT(P0,v)=3600*v**2*Pf*cSpec(v)*(-P0/v**2+1*cw*rhoL*A*v)/(3.6e6)


set term post eps enhanced color solid "Helvetica" 16

##############################################################
set out "Tempo_vs_VOT_C100km.eps"
print "plotting Tempo_vs_VOT_C100km.eps"
##############################################################

set param
set xlabel "v[km/h]"
set ylabel "kWh/100 km, l/100 km, Euro/100 km
set yrange [-2:50]; set ytics 5
set key

plot[v=10./3.6:200./3.6]\
 3.6*v, E100(P0BEV,v) t "BEV consumption [kWh/100 km]" w l ls 1,\
 3.6*v, C100(P0ICE,v) t "ICE consumption [l/100 km]" w l ls 2,\
 3.6*v, VOT(P0ICE,v) t "ICE VOT [Euro/h]" w l ls 8

