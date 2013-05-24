pro nonaxi, chi=chi, st=st, zmax=zmax
  
  m = 2
  chi_tilde = 0.5*(chi^2-1)/(chi^2+1)

  omv_kida = (3d0/2d0)/(chi - 1d0)
  omv_gng  = sqrt(3./(chi^2-1d0)) 

  omv = omv_kida
  
  A_over_B  = omv
  A_over_B /= st*(2.0*omv*((chi^2+1.0)/chi)-(2.0*omv^2+3.0))
  k2sq_m1 = dcomplex(0,1d0)*m*A_over_B
   
  nz = 128
  z = zmax*dindgen(nz)/(nz-1d0)

  epsilon = 0.5*chi_tilde^2*z*beselj(z,1)/k2sq_m1
  rho0=beselj(z,0)+epsilon

  rho2=-chi_tilde*beselj(z,2)/k2sq_m1

  data_kida = abs(rho2)/abs(rho0)

  
  omv = omv_gng
  
  A_over_B  = omv
  A_over_B /= st*(2.0*omv*((chi^2+1.0)/chi)-(2.0*omv^2+3.0))
  k2sq_m1 = dcomplex(0,1d0)*m*A_over_B
   

  epsilon = 0.5*chi_tilde^2*z*beselj(z,1)/k2sq_m1
  rho0=beselj(z,0)+epsilon

  rho2=-chi_tilde*beselj(z,2)/k2sq_m1
  
  data_gng = abs(rho2)/abs(rho0)
  
  phi=1.61
  set_plot,'ps'
  device,filename='nonaxi.eps',/encapsul,/color,$
         xsize=13.6,ysize=13.6/phi
  !p.font=0
  ps_fonts
  thick=3
  
  !p.color=0
  !p.background=255
  !p.charsize=1.
  
  !p.thick=thick
  !x.thick=thick
  !y.thick=thick
  
  !p.noerase=1

  loadct,5

  plot,z,data_kida,/nodata,ystyle=1,xrange=[0.,zmax],xstyle=1,$
       ytitle=textoidl('|\rho_2|/|\rho_0|'),$
       xtitle='!8z=ka!x'
  
  oplot,z,data_kida,color=120
  oplot,z,data_gng,color=50

  device,/close
end

