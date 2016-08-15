function R=ArcPath(p0,p2,H,Nt)
%    calculate quartic  arc from point [p0x, p0y, 0]
%    to [p2x, p2y, 0] with height H
%  
% Nt=100;
% H=2;
% p0=[0, 0];
% p2=[2, 2];

t=linspace(0,1, Nt);
for it=1:Nt
    Rxy(it,:)= p0 +t(it)*(p2-p0);
end

z= -4*H*(t -1/2).^2 + H;
for it=1:Nt
    R(:,it)=[Rxy(it,1), Rxy(it,2), z(it)];
end
