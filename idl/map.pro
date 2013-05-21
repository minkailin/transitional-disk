

chi = 4

a=grange(0.,5.,100)

delta=1e-2
St=1e-2

para=delta/St

omega_kida = 3./2 * 1./(chi-1)     & omega1=omega_kida
omega_goodman = sqrt(3./(chi^2-1)) & omega2=omega_goodman

epsp =  1. + 1./chi^2

f_kida = sqrt(2*chi*omega1 - (2*omega1^2 + 3)/epsp)
f_good = sqrt(2*chi*omega2 - (2*omega1^2 + 3)/epsp)

Hvk=1./f_kida * sqrt(para)
Hvg=1./f_good * sqrt(para)

rhok=exp(-a^2/(2*hvk^2))
rhog=exp(-a^2/(2*hvg^2))

nu=grange(0,2*!pi,100)
xx=a#cos(nu)
yy=(a*chi)#sin(nu)
loadct,5
h=0.1
r0=1./h
rr = xx + r0
phi = yy/r0

rrk=rebin(rhok,100,100)
rrg=rebin(rhog,100,100)

!p.multi=[0,2,1]

aa=minmax([rrk,rrg])

contour,rrk,rr*cos(phi),rr*sin(phi),/fill,lev=grange(0,aa[1],50),/iso,$
        xr=r0*[-2,2],yr=r0*[-2,2]

contour,rrg,rr*cos(phi),rr*sin(phi),/fill,lev=grange(0.,aa[1],50),/iso,$
        xr=r0*[-2,2],yr=r0*[-2,2]

!p.multi=0

;x -> r-r0
;y -> ro*phi


end
