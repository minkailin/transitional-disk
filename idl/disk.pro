
r=grange(0.1,1.5,100)
phi=grange(-!pi,!pi,100)

hor=0.1 & r0=1. 

xloc = r-r0
yloc = r0*phi

chi=4.
xx=rebin(xloc,100,100)
yy=rebin(transpose(yloc),100,100)

a2=xx^2 + yy^2/chi^2

delta_Stokes=1. 

H=r0*hor

epsp = 1 + 1./chi^2
omega_v = 3./(2*(chi-1))
;omega_v = sqrt(3./(chi^2-1))
f=sqrt(2*omega_v*chi - 1./epsp * (2*omega_v^2+3)) 

Hv = H/f * sqrt(delta_Stokes)

expo=exp(-a2/(2*Hv^2))
loadct,5
contour,expo,r#cos(phi),r#sin(phi),/fill,lev=grange(0,max(expo),100),/iso

end
