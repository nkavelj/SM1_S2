%% Einlesen
%Spalten werden vertauscht, um x und y an der intuitiv richtigen Stelle zu
%haben
oe=[Oertlich(1:9,2),Oertlich(1:9,1)];
gk=[GK(:,2),GK(:,1)];
%% Parameter, P1 und P5
dx1=oe(5,1)-oe(1,1);
dx_1=gk(5,1)-gk(1,1);
dy1=oe(5,2)-oe(1,2);
dy_1=gk(5,2)-gk(1,2);
a1=(dx1*dx_1+dy1*dy_1)/(dx1^2+dy1^2);
o1=(dx1*dy_1+dy1*dx_1)/(dx1^2+dy1^2);
disp('Parametersatz, P1 und P5');
x0_1=gk(1,1)-a1*oe(1,1)+o1*oe(1,2)
y0_1=gk(1,2)-o1*oe(1,1)-a1*oe(1,2)
m1=sqrt(o1^2+a1^2)
e1=atan2(o1,a1)
%% Parameter, P1 und P9
dx2=oe(9,1)-oe(1,1);
dx_2=gk(9,1)-gk(1,1);
dy2=oe(9,2)-oe(1,2);
dy_2=gk(9,2)-gk(1,2);
a2=(dx2*dx_2+dy2*dy_2)/(dx2^2+dy2^2);
o2=(dx2*dy_2+dy2*dx_2)/(dx2^2+dy2^2);
disp('Parametersatz, P1 und P9');
x0_2=gk(1,1)-a2*oe(1,1)+o2*oe(1,2)
y0_2=gk(1,2)-o2*oe(1,1)-a2*oe(1,2)
m2=sqrt(o2^2+a2^2)
e2=atan2(o2,a2)
%% Transformation
%Herleitung f�r diese Transformationsformel ist in der Ausarbeitung
%enthalten
ziel_1=[x0_1 y0_1;x0_1 y0_1;x0_1 y0_1;x0_1 y0_1;x0_1 y0_1;x0_1 y0_1;x0_1 y0_1;x0_1 y0_1;x0_1 y0_1]+m1*oe*[cos(e1) sin(e1);-sin(e1) cos(e1)];
ziel_2=[x0_2 y0_2;x0_2 y0_2;x0_2 y0_2;x0_2 y0_2;x0_2 y0_2;x0_2 y0_2;x0_2 y0_2;x0_2 y0_2;x0_2 y0_2]+m2*oe*[cos(e2) sin(e2);-sin(e2) cos(e2)];
%% Restklaffungen, Berechnung
r1=gk-ziel_1;
r2=gk-ziel_2;
%% Restklaffungen, Plot
figure
quiver([ziel_1(:,2);4.48*1.0e+06],[ziel_1(:,1);5.485*1.0e+06],[r1(:,2);100],[r1(:,1);0])
axis equal
hold on
plot1=plot(4.48*1.0e+06,5.485*1.0e+06,'x');
legend(plot1,'Ma�stabspfeil 100m')
figure
quiver([ziel_2(:,2);4.48*1.0e+06],[ziel_2(:,1);5.485*1.0e+06],[r2(:,2);100],[r2(:,1);0])
axis equal
hold on
plot2=plot(4.48*1.0e+06,5.485*1.0e+06,'x');
legend(plot2,'Ma�stabspfeil 100m')