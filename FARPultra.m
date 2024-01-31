function [S,dij,WR] = FARPultra(G,nami,gamma)
W2=sum(sum(G(:,:)));
mi=sum(G);mj=sum(G)';
mimj=mj*mi;
WR=(G-gamma*mimj/W2)+diag(diag(gamma*mimj/W2));
mink=min(min(WR));maxk=max(max(WR));
dij=1-(WR-mink)/(maxk-mink);
dii=zeros(size(dij));
djj=zeros(size(dij));
for i=1:size(G,1)
    dii(i,:)=dij(i,i);
    djj(:,i)=dij(i,i);
end
pij=exp(-(dij-(dii+djj)/2)/nami);
S=dij.*pij;
for i=1:size(G,1)
    S(i,i)=1-sum(S(i,:));
end
end