function tdeptdetect = deltai_t(t)		%time dependent detection rate

deltai0 = 1/9.2;
deltaif = 0.5642;
ts = 27;
r2 = 0.7174;

if t >= ts
	tdeptdetect = ( (deltai0-deltaif)*exp(-r2*(t-ts)) ) + deltaif;
else
	tdeptdetect = deltai0;

end