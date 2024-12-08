clear all;
clc;
global miu;
global J;
global Re;
Re=6378.145e+03;

r0=1e+6*[-0.24322284327422;-3.79199144866264;6.32444994784559];
v0=1e+03*[-1.64209188480826;6.17220916529869;3.63756062689151];


x0=[r0;v0];
t0=0;
tf=24*3600*10;
tspan=[t0,tf];
option=odeset('RelTol',1e-13);
[t_orbit,x_orbit]=ode45('dif_orbit_dynamics',tspan,x0,option);


%plot the location of the sat
figure;
subplot(3,1,1)
plot(t_orbit,x_orbit(:,1));
ylabel('X location(m)')
subplot(3,1,2)
plot(t_orbit,x_orbit(:,2));
ylabel('Y location(m)')
subplot(3,1,3)
plot(t_orbit,x_orbit(:,3));
ylabel('Z location(m)')
xlabel('flight time(s)')

%plot the speed of the sat
figure;
subplot(3,1,1)
plot(t_orbit,x_orbit(:,4));
ylabel('X speed(m/s)')
subplot(3,1,2)
plot(t_orbit,x_orbit(:,5));
ylabel('Y speed(m/s)')
subplot(3,1,3)
plot(t_orbit,x_orbit(:,6));
ylabel('Z speed(m/s)')
xlabel('flight time(s)')

figure;
plot(t_orbit,(sqrt(x_orbit(:,1).^2+x_orbit(:,2).^2+x_orbit(:,3).^2)-Re)/1000);
ylabel('location(m)')
xlabel('flight time(s)')
%3d sim of the sat to the earth
figure;
plot3(x_orbit(:,1),x_orbit(:,2),x_orbit(:,3),'r','Color','r','LineWidth',1);
xlabel('X location(m)')
ylabel('Y location(m)')
zlabel('Z location(m)')
grid;
hold on;
[Xe,Ye,Ze]=sphere(24);
Xe=Re*Xe;
Ye=Re*Ye;
Ze=Re*Ze;
surf(Xe,Ye,Ze)
axis equal;

%plot ur location
longitude_A=(116+28/60)*pi/180;
latitude_A=(39+48/60)*pi/180;

X_beijing=cos(latitude_A)*cos(longitude_A)*Re;
Y_beijing=cos(latitude_A)*sin(longitude_A)*Re;
Z_beijing=sin(latitude_A)*Re;
plot3(X_beijing,Y_beijing,Z_beijing,'pr','Color','g','MarkerSize',20,...
    'MarkerFaceColor','#D9FFFF')

