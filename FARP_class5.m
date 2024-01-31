load class5X.mat
load class5.mat
x1=Xtest(1:500,:);
x2=Xtest(501:700,:);
x3=Xtest(701:900,:);
x4=Xtest(901:1100,:);
x5=Xtest(1101:1300,:);
n1=size(x1,1);
n2=size(x2,1);
n3=size(x3,1);
n4=size(x4,1);
n5=size(x5,1);
n=n1+n2+n3+n4+n5;
n1l=15;
n1u=n1-n1l;
n2l=2;
n2u=n2-n2l;
n3l=2;
n3u=n3-n3l;
n4l=2;
n4u=n4-n4l;
n5l=2;
n5u=n5-n5l;
% X=[x1u;x2u;x3u;x4u;x5u;x1l;x2l;x3l;x4l;x5l];
x1u=X(1:n1u,:);
x2u=X(n1u+1:n1u+n2u,:);
x3u=X(n1u+n2u+1:n1u+n2u+n3u,:);
x4u=X(n1u+n2u+n3u+1:n1u+n2u+n3u+n4u,:);
x5u=X(n1u+n2u+n3u+n4u+1:n1u+n2u+n3u+n4u+n5u,:);
x1l=X(n1u+n2u+n3u+n4u+n5u+1:n1u+n2u+n3u+n4u+n5u+n1l,:);
x2l=X(n1u+n2u+n3u+n4u+n5u+n1l+1:n1u+n2u+n3u+n4u+n5u+n1l+n2l,:);
x3l=X(n1u+n2u+n3u+n4u+n5u+n1l+n2l+1:n1u+n2u+n3u+n4u+n5u+n1l+n2l+n3l,:);
x4l=X(n1u+n2u+n3u+n4u+n5u+n1l+n2l+n3l+1:n1u+n2u+n3u+n4u+n5u+n1l+n2l+n3l+n4l,:);
x5l=X(n1u+n2u+n3u+n4u+n5u+n1l+n2l+n3l+n4l+1:n,:);
DE=pdist2(X,X,"euclidean");
sigma2=median(DE(:));
G=exp(-DE.^2/2/sigma2); 
nami=0.01;
gamma=0.2;
[S,D,WR]=FARPultra(G,nami,gamma);
sul=S(1:n1u+n2u+n3u+n4u+n5u,n1u+n2u+n3u+n4u+n5u+1:n);
Y1=[];Y2=[];Y3=[];Y4=[];Y5=[];
for i=1:n1l
    Y1=[Y1;[1,0,0,0,0]];
end
for i=1:n2l
    Y2=[Y2;[0,1,0,0,0]];
end
for i=1:n3l
    Y3=[Y3;[0,0,1,0,0]];
end
for i=1:n4l
    Y4=[Y4;[0,0,0,1,0]];
end
for i=1:n5l
    Y5=[Y5;[0,0,0,0,1]];
end
yl=[Y1;Y2;Y3;Y4;Y5];
yu=sul*yl;
X12=[x1u;x2u;x3u;x4u;x5u];
Y1t=[];
Y2t=[];
Y3t=[];
Y4t=[];
Y5t=[];
for i=1:size(X12,1)
    ly=find(yu(i,:)==max(yu(i,:)));
    if ly==1
        Y1t=[Y1t;X12(i,:)];
    elseif ly==2
        Y2t=[Y2t;X12(i,:)];
    elseif ly==3
               Y3t=[Y3t;X12(i,:)]; 
    elseif ly==4
               Y4t=[Y4t;X12(i,:)]; 
    else
                    Y5t=[Y5t;X12(i,:)]; 
                
    end
end
scatter(Y1t(:,1),Y1t(:,2),MarkerEdgeColor='none',MarkerFaceColor='#87CEFA')
hold on
scatter(Y2t(:,1),Y2t(:,2),MarkerEdgeColor='none',MarkerFaceColor='#FA8072')
hold on
scatter(Y3t(:,1),Y3t(:,2),MarkerEdgeColor='none',MarkerFaceColor='#00FA9A')
hold on
scatter(Y4t(:,1),Y4t(:,2),MarkerEdgeColor='none',MarkerFaceColor='#EEDD82')
hold on
scatter(Y5t(:,1),Y5t(:,2),MarkerEdgeColor='none',MarkerFaceColor='#FFE4E1')
hold on

scatter(x1l(:,1),x1l(:,2),MarkerEdgeColor='none',MarkerFaceColor='#000080')
hold on
scatter(x2l(:,1),x2l(:,2),MarkerEdgeColor='none',MarkerFaceColor='#B22222')
hold on
scatter(x3l(:,1),x3l(:,2),MarkerEdgeColor='none',MarkerFaceColor='#006400')
hold on
scatter(x4l(:,1),x4l(:,2),MarkerEdgeColor='none',MarkerFaceColor='#B8860B')
hold on
scatter(x5l(:,1),x5l(:,2),MarkerEdgeColor='none',MarkerFaceColor='#8B7D7B')

set(gca,'xticklabel',[],'yticklabel',[])
box on
grid on