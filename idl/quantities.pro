
chi=3.1
omega1 = 3./2 * 1./(chi-1)
omega2 = sqrt(3./(chi^2-1))
epsp =  1. + 1./chi^2
f2_kida = 2*chi*omega1 - (2*omega1^2 + 3)/epsp
f2_good = 2*chi*omega2 - (2*omega2^2 + 3)/epsp
gas_contrast_kida = exp(f2_kida/(2*omega1^2*chi^2))
gas_contrast_good = exp(f2_good/(2*omega2^2*chi^2))

dust_contrast=130.

S1 = alog(dust_contrast/gas_contrast_kida)
S2 = alog(dust_contrast/gas_contrast_good)

S=.5*(S1+S2)

print,'S-kida,S-GNG=',S1,S2

G=6.67384e-8
Msun=2e33 ; g
Mstar=1.9891*Msun
AU=1.49597871e13
r=63*AU

lnOmega2 = alog(G*Mstar)-3*alog(r) 
Omega = sqrt(exp(lnOmega2))

T = 60 ;K
Rgas=8.314d7
gamma=1.4
gamma1=1./gamma
mmol=2.4
Rgasmu=Rgas/mmol
cp=gamma*Rgasmu/(gamma-1)
cv=cp/gamma
cs2=T*cp*(gamma-1)
;print,sqrt(cs2)/1e2
cs2_iso=cs2/gamma
;print,sqrt(cs2_iso)/1e2

;cs_m = sqrt(cs2_iso) ;m/s 
;cs = cs_m * 100. 
cs=sqrt(cs2_iso)
H = cs/Omega

print,'isothermal sound speed=',cs/1e2, ' m/s'
print,'scale height=',H/AU,' AU'

abullet = 0.4
rhobullet=0.8


;;; Brown estimate
rhog_brown=1e-14 ; g/cm3

;;; Nienke estimate
r_ref= 20 * AU
Sigma0 = 1.35*1e-4 * Mstar/r_ref^2
Sigma = Sigma0 / (r/r_ref) 
rhog_nienke = Sigma/(sqrt(2*!pi)*H)

rhog=rhog_brown

;print,sigma0,sigma,rhog_nienke
;stop



;St = sqrt(!pi/8) * abullet/H * rhobullet/rhog
St = sqrt(!pi/8) * abullet/H * rhobullet/rhog

print,'Stokes number=',St

delta=St/S

print,'delta =',delta

print,'turbulent velocities=',sqrt(delta)*100,'% of sound speed'

epsilon=0.01
mearth=3e-6*msun
mass_tmp=(2*!pi)^1.5 * epsilon * rhog * chi * H/mearth 
Hg_kida = H^2/f2_kida
Hg_good = H^2/f2_good
mass1=mass_tmp * Hg_kida
mass2=mass_tmp * Hg_good

print,'trapped mass - kida, gng',mass1,mass2, ' Earth masses'


end
