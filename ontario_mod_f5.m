S0 = 1.993*(10^6); %susceptibles
E0 = 10;		   %exposed	
I0 = 10;		   %infected w/ symptoms
A0 = 24;		   %asymptomatic infected
Sq0 = 0;		   %quarantined susceptibles
Eq0 = 0;		   %isolated exposed
D0 = 5;			   %dead?
R0 = 0;			   %recovered

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

N = S0 + E0 + I0 + A0 +Sq0 +Eq0 + D0 + R0;

tspan = [0 100]; % feb 26 to june 5
IC = [S0; E0; I0; A0; Sq0; Eq0; D0; R0];

[t,x] = ode45(@(t,x) ontario_odes_inf_f5(t,x,N), tspan, IC);

tiledlayout(2,2)
nexttile
plot(t,x(:,3)) %symptomatic infected
title('(A)')
ylabel('I(t)')
xlabel('Days')
nexttile
title('')
plot(t,x(:,7)) %death
title('(B)')
ylabel('D(t)')
xlabel('Days')
%figure()
nexttile
plot(t,x(:,4)) %asymptomatic infected
title('(C)')
ylabel('A(t)')
xlabel('Days')



t = 0:100;
arr = zeros(1,100)
for i = 1:101
	arr(i) = r_t(i);
end
nexttile
plot(t,arr)
title('(D)')
ylabel('Effective reproduction number')
xlabel('Days')





%[S = x(1), E = x(2), I = x(3), A = x(4), S_Q = x(5), E_Q = x(6), D = x(7), R = x(8)]