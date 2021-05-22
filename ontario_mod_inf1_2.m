
S0 = 1.999*(10^6); %susceptibles
E0 = 12;		   %exposed	
I0 = 7;		   %infected w/ symptoms
A0 = 24;		   %asymptomatic infected
Sq0 = 0;		   %quarantined susceptibles
Eq0 = 0;		   %isolated exposed
D0 = 5;			   %dead?
R0 = 0;			   %recovered

N = S0 + E0 + I0 + A0 +Sq0 +Eq0 + D0 + R0;

tspan = [0 80]; %32 days
IC = [S0; E0; I0; A0; Sq0; Eq0; D0; R0];


tiledlayout(2,2)
nexttile
for a = [0.3,0.5,0.7,1] 
	[t,x] = ode45(@(t,x) ontario_odes_inf1_2beta(t,x,N,a), tspan, IC);
	plot(t,x(:,3))
	hold on
end
title('(A)')
legend({'\beta = 0.3*\beta_0','\beta = 0.5*\beta_0','\beta = 0.7*\beta_0','\beta = 1*\beta_0'}, 'Location','Northwest')
hold off
ylabel('I(t)')
xlabel('Days from February 26, 2020')

nexttile
for a = [2.5,2,1.5,1] 
	[t,x] = ode45(@(t,x) ontario_odes_inf1_2q0(t,x,N,a), tspan, IC);
	plot(t,x(:,3))
	hold on
end
title('(B)')
legend({'q = 2.5*q_0','q = 2*q_0','q = 1.5*q_0','q = 1*q_0'}, 'Location','Northwest')
hold off
ylabel('I(t)')
xlabel('Days from February 26, 2020')
nexttile
for a = [6,4,2,1] 
	[t,x] = ode45(@(t,x) ontario_odes_inf1_2delta(t,x,N,a), tspan, IC);
	plot(t,x(:,3))
	hold on
end
title('(C)')
legend({'\delta_I = 6*\delta_{I0}','\delta_I = 4*\delta_{I0}','\delta_I = 2*\delta_{I0}','\delta_I = 1*\delta_{I0}'}, 'Location','Northwest')
hold off
ylabel('I(t)')
xlabel('Days from February 26, 2020')
%[S = x(1), E = x(2), I = x(3), A = x(4), S_Q = x(5), E_Q = x(6), D = x(7), R = x(8)]