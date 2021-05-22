
clc; 
S0 = 1.999*(10^6); %susceptibles
E0 = 10;		   %exposed	
I0 = 7.6;		   %infected w/ symptoms
A0 = 15;		   %asymptomatic infected
Sq0 = 0;		   %quarantined susceptibles
Eq0 = 0;		   %isolated exposed
D0 = 5;			   %dead?
R0 = 0;			   %recovered

N = S0 + E0 + I0 + A0 +Sq0 +Eq0 + D0 + R0;

tspan = [0 32]; %32 days
IC = [S0; E0; I0; A0; Sq0; Eq0; D0; R0];

%	31 cols -> dataset

%r_c = ((beta*rho*c*(1-q))/(deltaI + alpha + gammaI)) + (beta*c*theta*(1-rho)*(1-q))/gammaA;


[t,x] = ode45(@(t,x) ontario_odes1(t,x,N), tspan, IC);


datasamp = ConfirmedPositive;

tspan2 = linspace(0,31,31)
plot(t,x(:,3))
hold on
plot(tspan2,datasamp, '-o')

legend({'Model', 'Data'}, 'Location', 'Northwest')
ylabel('Accumulated Report Cases') %feb25 - may1
xlabel('Days')
hold off

%[S = x(1), E = x(2), I = x(3), A = x(4), S_Q = x(5), E_Q = x(6), D = x(7), R = x(8)]