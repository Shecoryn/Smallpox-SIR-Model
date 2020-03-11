clear all
clf
close all

global beta
global nu

%Give values for constants beta and nu.

beta = 0.406; %0.407
nu = 41.17;    %41.1

%Initial time
t0 = 0;

%Final time
tf = 1000;

%Integration step
tstep=0.01;

%Initial vector (initial conditions, e.g., x0=0.1 and y0=0.3) Y0=[x0 y0]
Y0= [120
     0.1];

[T,Y] = ode45(@smallpox,t0:tstep:tf,Y0);

% Import the raw data for comparison
Susceptibles = [120, 119, 118, 117, 116, 115, 114, 113, ...
    112, 111, 110, 109, 108, 107, 106, 105, 104, 103, ... 
    102, 101, 100, 99, 98, 97, 96, 95, 94, 93, 92, 91, 90];  
TotalDays = [0, 1, 14, 21, 23, 26, 26, 26, 27, ...
    31, 36, 39, 41, 41, 43, 43, 48, 51, 52, 56, ...
    56, 57, 58, 59, 61, 61, 62, 66, 66, 71, 76];

% x- and y-coordiates (entries of column-vector Y)
x=Y(:,1); %dS/dt : Change in Susceptibles
y=Y(:,2); %dI/dt : Change in Infecteds
t=T*100; %This is a list of days, so that we may compare graphs

figure
plot(x,y)
xlabel('# of Susceptibles (S)')
ylabel('# of Infected (I)')
axis([80 120 0 5])
title('I(S)')       
       
figure
plot(y)
xlabel('Time (days)')
ylabel('# of Infected (I)')
axis([0 90 0 5]);
title('I(t)')

figure
%plot(x)
plot(t,x,TotalDays,Susceptibles) % you can only add extra graphs in multiples of two
xlabel('Time (days)')
ylabel('# of Suceptibles (S)')
axis([0 90 0 130]);
title('S(t)')