

ps=1

phi=1.61

if (ps eq 0) then begin
   set_plot,'x'
   thick=1
endif else begin
   set_plot,'ps'
   device,filename='gaussian.eps',/encapsul,/color,$
          xsize=13.6,ysize=13.6/phi
   !p.font=0
   ps_fonts
   thick=3
endelse

!p.color=0
!p.background=255
!p.charsize=1.

!p.thick=thick
!x.thick=thick
!y.thick=thick

chi = 4

a=grange(0.,5.,100)

delta=1e-2
St=1e-2

para=[0.1,1,0.25,10] ;delta/St

omega_kida = 3./2 * 1./(chi-1)     & omega1=omega_kida
omega_goodman = sqrt(3./(chi^2-1)) & omega2=omega_goodman

epsp =  1. + 1./chi^2

f_kida = sqrt(2*chi*omega1 - (2*omega1^2 + 3)/epsp)
f_good = sqrt(2*chi*omega2 - (2*omega1^2 + 3)/epsp)

rhok=fltarr(100,4)
rhog=fltarr(100,4)

for i=0,3 do begin
   Hvk=1./f_kida * sqrt(para[i])
   Hvg=1./f_good * sqrt(para[i])

   rhok[*,i]=exp(-a^2/(2*hvk^2))
   rhog[*,i]=exp(-a^2/(2*hvg^2))
endfor

!p.multi=0

loadct,5

 plot,a,rhok[*,0],/nodata,$
      xtitle='!8a/H!x',ytitle=textoidl("\rho")+"!8!dd!n(a)!x",$
      title="Dust distribution"

      
oplot,a,rhok[*,0],li=2,color=120
oplot,a,rhog[*,0],li=2,color=50

oplot,a,rhok[*,1],li=0,color=120
oplot,a,rhog[*,1],li=0,color=50

;oplot,a,rhok[*,2],color=200

oplot,a,rhok[*,3],li=3,color=120
oplot,a,rhog[*,3],li=3,color=50

!p.multi=0

;delta/St=0.25 kida is equal to delta/St=0.1 goodman for chi=4

;legend,["Kida","GNG"],li=[0,0],color=[120,50],box=0,$
;       position=[3.4,0.99]

sdelta=textoidl("\delta")

legend,[sdelta+"/St=10",sdelta+"/St=1",sdelta+"/St=0.1"],$
       li=[3,0,2],color=[0,0,0],box=0,$
       position=[2.8,0.5],charsize=0.9

;xyouts,.85,0.15,sdelta+"/St=0.1",orientation=-50
;xyouts,2.25,0.315,sdelta+"/St=1",orientation=-40
;xyouts,3.5,0.735,sdelta+"/St=10",orientation=-30



if (ps eq 1) then begin
   device,/close
   set_plot,'x'
endif


end
