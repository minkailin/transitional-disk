
!p.color=0
!p.background=255
!p.charsize=1.

ps=1

phi=1.61

if (ps eq 0) then begin
   set_plot,'x'
   thick=1
endif else begin
   set_plot,'ps'
   device,filename='scale_function.eps',/encapsul,/color,$
          xsize=13.6,ysize=13.6/phi
   !p.font=0
   ps_fonts
   thick=3
endelse
!p.thick=thick
!x.thick=thick
!y.thick=thick

chi = grange(2.,10,100)

omega_kida = 3./2 * 1./(chi-1)     & omega1=omega_kida
omega_goodman = sqrt(3./(chi^2-1)) & omega2=omega_goodman

epsp =  1. + 1./chi^2

f_kida = sqrt(2*chi*omega1 - (2*omega1^2 + 3)/epsp)
f_good = sqrt(2*chi*omega2 - (2*omega2^2 + 3)/epsp)

loadct,5

schi=textoidl("\chi")

 plot,chi,f_kida,/nodata,$
      xtitle=schi,ytitle="f("+schi+")",$
      title="Scale function"
oplot,chi,f_kida,color=120
oplot,chi,f_good,color=50

legend,["Kida","GNG"],li=[0,0],color=[120,50],box=0,/bottom,/right

if (ps eq 1) then begin
   device,/close
   set_plot,'x'
endif

end
