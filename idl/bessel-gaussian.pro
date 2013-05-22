
k=1

x=grange(0.,2,100)

a=exp(-k^2*x^2/4)
b=beselj(k*x,0)

!p.multi=[0,1,2]

plot,x,exp(-k^2*x^2/4),yr=[-0.5,1],ys=1

oplot,x,beselj(k*x,0),li=2

oplot,x,replicate(0,100),li=1

plot,x,(a-b)/a * 100.

!p.multi=0




end
