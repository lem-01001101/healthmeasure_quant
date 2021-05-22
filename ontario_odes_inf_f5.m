function vmod = ontario_odes_inf_f5(t, x, N)	%feb26 to mar21 parameters, t = time, x = state var, N = pop, a = multiplier for loop

%c = 11.5539;	%contact rate
beta = 0.1438;	%prob of transmission
q = 0.1003; 	%quanratine rate of exposed indiv
sigma = 0.2;	%transition rate of exposed indiv to infected
lambda = 1/14;	%rate of quarantine uninfected released into community
rho = 0.6201;		%prob of symptoms among infected
%deltaI = 0.1;	%transition rate of symptomatic infected indiv to quarantined infected
deltaq = 0.1;	%transition rate of quarantined exposed to quarantined infected
gammaI = 0.1830;	%recovery rate of symptomatic infected
gammaA = 0.139;	%recovery rate of asymptomatic infected
gammaH = 0.2;	%recovery rate of quarantined diagnosed indiv
alpha = 0.008;	%disease induced death rate
theta = 0.0494;	%modification factor of symptomatic infectiousness

vmod(1) =  (-(beta*c_t(t) + c_t(t)*q*(1-beta))*x(1)*(x(3)+(theta*x(4)))/N ) + lambda*x(5);	

vmod(2) = (beta*c_t(t)*(1-q)*x(1)*(x(3)+(theta*x(4)))/N) - sigma*x(2);

vmod(3) = sigma*rho*x(2) - x(3)*(deltai_t(t)+alpha+gammaI);

vmod(4) = sigma*(1-rho)*x(2) - gammaA*x(4);

vmod(5) = ((1-beta)*c_t(t)*q*x(1)*(x(3)+(theta*x(4)))/N) - lambda*x(5);

vmod(6) = (beta*c_t(t)*q*x(1)*(x(3)+(theta*x(4)))/N) - deltaq*x(6);

vmod(7) = deltai_t(t)*x(3) + deltaq*x(6) - x(7)*(alpha+gammaH);

vmod(8) = gammaI*x(3) + gammaA*x(4) + gammaH*x(7);


vmod = vmod'; %vmod(:)



%[S = x(1), E = x(2), I = x(3), A = x(4), S_Q = x(5), E_Q = x(6), D = x(7), R = x(8)]