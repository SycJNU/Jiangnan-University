load twomoon.mat
xp=Xtest(1:500,:);
xn=Xtest(501:1000,:);
np=size(xp,1);
nn=size(xn,1);
n=np+nn;
nxpl=25;
nxpu=np-nxpl;
nxnl=25;
nxnu=nn-nxnl;
xpl=xp(1:nxpl,:);
xpu=xp(nxpl+1:np,:);
xnl=xn(1:nxnl,:);
xnu=xn(nxnl+1:nn,:);
X=[xpu;xnu;xpl;xnl];
DE=pdist2(X,X,"euclidean");
sigma2=median(DE(:));
G=exp(-DE.^2/2/sigma2); 
nami=0.01;
gamma=0.2;
[S,D,WR]=FARPultra(G,nami,gamma);
sul=S(1:nxpu+nxnu,nxpu+nxnu+1:n);
Yp=[];Yn=[];
for i=1:nxpl
    Yp=[Yp;1];
end
for i=1:nxnl
    Yn=[Yn;-1];
end
yl=[Yp;Yn];
yu=sul*yl;
X12=[xpu;xnu];
Y1=[];
Y2=[];
for i=1:size(X12,1)
    if yu(i)>0
        Y1=[Y1;X12(i,:)];
    else
        Y2=[Y2;X12(i,:)];
    end
end
scatter(Y1(:,1),Y1(:,2),MarkerEdgeColor='none',MarkerFaceColor='#FA8072')
hold on
scatter(Y2(:,1),Y2(:,2),MarkerEdgeColor='none',MarkerFaceColor='#87CEFA')
hold on
scatter(xpl(:,1),xpl(:,2),MarkerEdgeColor='none',MarkerFaceColor='#B22222')
hold on
scatter(xnl(:,1),xnl(:,2),MarkerEdgeColor='none',MarkerFaceColor='#000080')
set(gca,'xticklabel',[],'yticklabel',[])
box on
grid on
