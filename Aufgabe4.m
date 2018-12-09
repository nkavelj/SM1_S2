%% Einlesen
%Spalten werden vertauscht, um x und y an der intuitiv richtigen Stelle zu
%haben
p1=[Oertlich(1,2),Oertlich(1,1)];
p5=[Oertlich(5,2),Oertlich(5,1)];
p9=[Oertlich(9,2),Oertlich(9,1)];
p1_gk=[GK(1,2),GK(1,1)];
p5_gk=[GK(5,2),GK(5,1)];
p9_gk=[GK(9,2),GK(9,1)];
oe_trafo = [Oertlich(10:13,2),Oertlich(10:13,1)];
oe=[Oertlich(1:9,2),Oertlich(1:9,1)];
gk=[GK(:,2),GK(:,1)];
%% Parameter
D=(p5(2)-p1(2))*(p9(1)-p1(1))-(p9(2)-p1(2))*(p5(1)-p1(1));
disp('Parameter:');
a1=(1/D)*((p5(2)-p1(2))*(p9_gk(1)-p1_gk(1))-(p9(2)-p1(2))*(p5_gk(1)-p1_gk(1)))
a2=(1/D)*((p9(1)-p1(1))*(p5_gk(1)-p1_gk(1))-(p5(1)-p1(1))*(p9_gk(1)-p1_gk(1)))
b1=(1/D)*((p5(2)-p1(2))*(p9_gk(2)-p1_gk(2))-(p9(2)-p1(2))*(p5_gk(2)-p1_gk(2)))
b2=(1/D)*((p9(1)-p1(1))*(p5_gk(2)-p1_gk(2))-(p5(1)-p1(1))*(p9_gk(2)-p1_gk(2)))
a0=p1_gk(1)-a1*p1(1)-a2*p1(2)
b0=p1_gk(2)-b1*p1(1)-b2*p1(2)
mx=sqrt(a1^2+b1^2)
my=sqrt(a2^2+b2^2)
epsilon=atan2(b1,a1)
gamma=atan2(b2,a2)-epsilon
%% Transformation von P12, P16, P18, P23
%Herleitung für diese Transformationsformel ist in der Ausarbeitung
%enthalten
disp('Transformierte Punkte 12,16,18,23 als (x,y):');
gk_trafo=[a0 b0;a0 b0;a0 b0;a0 b0]+oe_trafo*[a1 b1;a2 b2]
%% Transformation und Restklaffungen für P1-P9
gk_=[a0 b0;a0 b0;a0 b0;a0 b0;a0 b0;a0 b0;a0 b0;a0 b0;a0 b0]+oe*[a1 b1;a2 b2];
rk=gk-gk_;
%% Plots
figure;
scatter(gk_trafo(:,2),gk_trafo(:,1))
figure;
quiver([gk_(:,2);4.481*1.0e+06],[gk_(:,1);5.486*1.0e+06],[rk(:,2);0.05],[rk(:,1);0])
hold on
plot1=plot(4.481*1.0e+06,5.486*1.0e+06,'x');
legend(plot1,'Maßstabspfeil 5cm')