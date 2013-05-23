
ps=1

phi=1.61

if (ps eq 0) then begin
   set_plot,'x'
   thick=1
endif else begin
   set_plot,'ps'
   device,filename='bessel-gaussian.eps',/encapsul,/color,$
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

k=1

maxx=2.4

x=grange(0.,maxx,100)

a=exp(-k^2*x^2/4)
b=beselj(k*x,0)

!p.noerase=1
plot,x,exp(-k^2*x^2/4),ys=1,yr=[0.,1.05],xr=[0.,maxx],xs=1,$
;     position=[0.1,0.22,0.95,0.95],$
     ytitle='!8F(x)!x',$
     xtitle='!8x!x'

oplot,x,beselj(k*x,0),li=2

oplot,x,replicate(0,100),li=2

legend,["exp(!8-x!u2!n/4!x)","!8J!d0!n(x)!x"],li=[0,2],box=0,/right,/top

;plot,x,(a-b)/a,xr=[0.,maxx],xs=1,/ylog,yr=[1e-5,2],ys=1,$
;     position=[0.1,0.07,0.95,0.21],xtitle='!8x!x'
     
;erase

;plot,x,(a-b)/a,xr=[0.,maxx],xs=1,/ylog,yr=[1e-5,2],ys=1,$
;     position=[0.1,0.1,0.95,0.95],xtitle='!8x!x'

if (ps eq 1) then begin
   device,/close
   set_plot,'x'
endif

end
