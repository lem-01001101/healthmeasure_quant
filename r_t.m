function repro = r_t(t)

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

repro = ((beta*rho*c_t(t)*(1-q))/(deltai_t(t) + alpha + gammaI)) + (beta*c_t(t)*theta*(1-rho)*(1-q))/gammaA;

end