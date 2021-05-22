function vmod = ontario_odes1(t, x, N)		%feb26 to mar21 parameters

c = 11.7905;	%contact rate
beta = 0.1450;	%prob of transmission
q = 0.0810; 	%quanratine rate of exposed indiv
sigma = 0.2;	%transition rate of exposed indiv to infected
lambda = 0.7;	%rate of quarantine uninfected released into community
rho = 0.6;		%prob of symptoms among infected
deltaI = 0.1;	%transition rate of symptomatic infected indiv to quarantined infected
%delta1delta10 = ;
%r2 = ;
%delta_if = ;
deltaq = 0.1;	%transition rate of quarantined exposed to quarantined infected
gammaI = 0.2;	%recovery rate of symptomatic infected
gammaA = 0.139;	%recovery rate of asymptomatic infected
gammaH = 0.2;	%recovery rate of quarantined diagnosed indiv
alpha = 0.008;	%disease induced death rate
theta = 0.0429;	%modification factor of symptomatic infectiousness

vmod(1) =  (-(beta*c + c*q*(1-beta))*x(1)*(x(3)+(theta*x(4)))/N ) + lambda*x(5);	

vmod(2) = (beta*c*(1-q)*x(1)*(x(3)+(theta*x(4)))/N) - sigma*x(2);

vmod(3) = sigma*rho*x(2) - x(3)*(deltaI+alpha+gammaI);

vmod(4) = sigma*(1-rho)*x(2) - gammaA*x(4);

vmod(5) = ((1-beta)*c*q*x(1)*(x(3)+(theta*x(4)))/N) - lambda*x(5);

vmod(6) = (beta*c*q*x(1)*(x(3)+(theta*x(4)))/N) - deltaq*x(6);

vmod(7) = deltaI*x(3) + deltaq*x(6) - x(7)*(alpha+gammaH);

vmod(8) = gammaI*x(3) + gammaA*x(4) + gammaH*x(7);


vmod = vmod(:);

%[S = x(1), E = x(2), I = x(3), A = x(4), S_Q = x(5), E_Q = x(6), D = x(7), R = x(8)]