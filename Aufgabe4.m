%% Einlesen
p1=[Oertlich(1,2),Oertlich(1,1)];
p5=[Oertlich(5,2),Oertlich(5,1)];
p9=[Oertlich(9,2),Oertlich(9,1)];
p1_gk=[GK(1,2),GK(1,1)];
p5_gk=[GK(5,2),GK(5,1)];
p9_gk=[GK(9,2),GK(9,1)];
oe_trafo = [Oertlich(10:13,2),Oertlich(10:13,1)];
%% Parameter
D=(p5(2)-p1(2))*(p9(1)-p1(1))-(p9(2)-p1(2))*(p5(1)-p1(1));
a1=(1/D)*((p5(2)-p1(2))*(p9_gk(1)-p1_gk(1))-(p9(2)-p1(2))*(p5_gk(1)-p1_gk(1)));
a2=(1/D)*((p9(1)-p1(1))*(p5_gk(1)-p1_gk(1))-(p5(1)-p1(1))*(p9_gk(1)-p1_gk(1)));
b1=(1/D)*((p5(2)-p1(2))*(p9_gk(2)-p1_gk(2))-(p9(2)-p1(2))*(p5_gk(2)-p1_gk(2)));
b2=(1/D)*((p9(1)-p1(1))*(p5_gk(2)-p1_gk(2))-(p5(1)-p1(1))*(p9_gk(2)-p1_gk(2)));