

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

Hg=1.

a=grange(0.,3.,100)

S=[0.0,0.1,1,10,100] ;delta/St

para=1/(S+1)

rhod=fltarr(100,5)
maxrhod = (S+1)^1.5

for i=0,4 do begin
   Hv=Hg * sqrt(para[i])
   rhod[*,i]=maxrhod[i]*exp(-a^2/(2*hv^2))
endfor

aa=max(rhod)
erase
!p.noerase=1

loadct,0

 plot,a,rhod[*,0],/nodata,$
      xtitle='!8a/H!dg!n!x',ytitle=textoidl("\rho")+"!8!dd!n(a)!x",$
      title="Dust distribution",yr=[1e-1,1000],/ylog,ys=3,color=0,xr=[0,2.5],xs=1

loadct,12

 cor=fix(indgen(17)/16. * 255)
;0      black                                                                   
;1      dark green                                                              
;3      light green                                                             
;6      anil                                                                    
;7      dark blue                                                               
;8      purple                                                                  
;9      dark pink                                                               
;13     red                                                                     
;15     grey                                                                    
;16     white  

oplot,a,rhod[*,0],li=0,color=0
oplot,a,rhod[*,1],li=1,color=cor[1]
oplot,a,rhod[*,2],li=2,color=cor[9]
oplot,a,rhod[*,3],li=3,color=cor[13]
oplot,a,rhod[*,4],li=4,color=cor[7]

legend,["!8S!x=0","!8S!x=0.1","!8S!x=1","!8S!x=10","!8S!x=100"],$
       li=[0,1,2,3,4],color=[0,cor[1],cor[9],cor[13],cor[7]],box=0,$
       position=[1.5,500],charsize=0.9

if (ps eq 1) then begin
   device,/close
   set_plot,'x'
endif


end
