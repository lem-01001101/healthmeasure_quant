function tdeptcontact = c_t(t)			%time dependent contact rate

c0 = 10.0005
cb = 3.4999
r1 = 0.0632
ts = 27;

if t >= ts
	tdeptcontact = ( (c0-cb)*exp(-r1*(t-ts)) ) + cb;
else
	tdeptcontact = c0;

end