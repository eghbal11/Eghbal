****************** Outbreak and Spreading***************
******************************************************
% this part relates to section III-A, equations (1), (2), figure 1 – (a), (b)
% (xop,yop) is optimal solution
% m is objective function
% (x0,y0) is initial solution 
% CVA is the best solution by CVA
x0=rand;y0=rand; a=0.5;n=10;r=0;p=0.8;rec=0.9; open=0.7;k=5;itr=5;r1=1;
m=exp(-(x0-4).^2-(y0-4).^2)+ exp(-(x0+4).^2-(y0-4).^2)+2* exp(-(x0).^2-(y0).^2)+2* exp(-(x0).^2-(y0+4).^2);
optimal=2,xop=0,yop=0,m,x0,y0
plot(4,4,'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])
hold on;
plot(-4,4,'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])
plot(0,0,'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])
plot(0,-4,'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])
plot(x0,y0,'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0.5,0.5,0.5])
hold on;
x=x0-a+2*a*rand(1,p*n);
y=y0-a+2*a*rand(1, p*n);
for i=p*n+1:n
  x(i)=x0+k*( -1+2*rand);
  y(i)=y0+k*( -1+2*rand);
  r=r+1;
  x1(r)=x(i);
  y1(r)=y(i);
end
for i=1: p*n
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
for i= 1:r
plot(x1(i),y1(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','m',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
r=0;
for j=floor((1-open)*n)+1 : p*n
x0=x(j);y0=y(j); 
m=exp(-(x0-4).^2-(y0-4).^2)+ exp(-(x0+4).^2-(y0-4).^2)+2* exp(-(x0).^2-(y0).^2)+2* exp(-(x0).^2-(y0+4).^2);
x=x0-a+2*a*rand(1,p*n);
y=y0-a+2*a*rand(1, p*n);
for i=p*n+1:n
  x(i)=x0+k*( -1+2*rand);
  y(i)=y0+k*( -1+2*rand);
  r=r+1;
  x1(r)=x(i);
  y1(r)=y(i);
end
for i=1: p*n
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
for i= 1:r
plot(x1(i),y1(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','m',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
end
************* Recovery, Remove and Transmission**********
******************************************************
% this part relates to section III-B, equations (3-6), figure 1 – (c), (d)
r=0;
for j=floor((1-open)*n)+1 : p*n
x0=x(j);y0=y(j); 
m=exp(-(x0-4).^2-(y0-4).^2)+ exp(-(x0+4).^2-(y0-4).^2)+2* exp(-(x0).^2-(y0).^2)+2* exp(-(x0).^2-(y0+4).^2);
x=x0-a+2*a*rand(1,p*n);
y=y0-a+2*a*rand(1, p*n);
for i=p*n+1:n
  x(i)=x0+k*( -1+2*rand);
  y(i)=y0+k*( -1+2*rand);
  r=r+1;
  x1(r)=x(i);
  y1(r)=y(i);
end
for i=1: p*n
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
for i= 1:r
plot(x1(i),y1(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','m',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
for i=1:n
  ob(i)=exp(-(x(i)-4).^2-(y(i)-4).^2)+ exp(-(x(i)+4).^2-(y(i)-4).^2)+2* exp(-(x(i)).^2-(y(i)).^2)+2* exp(-  (x(i)).^2-(y(i)+4).^2);
end
for i=1:p*n
   for j=1:p*n-1
      if (ob(j)>ob(j+1))
          w1= ob(j);
          ob(j)= ob(j+1);
          ob(j+1)=w1;
          w1= x(j);
          x(j)= x(j+1);
          x(j+1)=w1;
          w1= y(j);
          y(j)= y(j+1);
          y(j+1)=w1;
      end
    end
end
          obbest(r1)= ob(p*n);
          xbest(r1)= x(p*n);
          ybest(r1)= y(p*n);r1=r1+1;
plot(x(p*n), y(p*n),'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','y',...
    'MarkerFaceColor',[0.5,0.5,0.5])
for i=1: (1-open)*n
if (i<=(1-rec)*(1-open)*n) 
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0.5,0.5,0.5])
else
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
end
end
******************** Explosion and Eruption***************************
*******************************************************************
% this part relates to figure 1 – (e), (f)
for j=1 : (1-p)*n+1
x0=x1(j);y0=y1(j); 
m=exp(-(x0-4).^2-(y0-4).^2)+ exp(-(x0+4).^2-(y0-4).^2)+2* exp(-(x0).^2-(y0).^2)+2* exp(-(x0).^2-(y0+4).^2);
x=x0-a+2*a*rand(1,p*n);
y=y0-a+2*a*rand(1, p*n);
for i=p*n+1:n
  x(i)=x0+k*( -1+2*rand);
  y(i)=y0+k*( -1+2*rand);
  r=r+1;
  x1(r)=x(i);
  y1(r)=y(i);
end
for i=1: p*n
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
for i= 1:r
plot(x1(i),y1(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','m',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
end
for j=1 : (1-p)*n+1
x0=x1(j);y0=y1(j); 
m=exp(-(x0-4).^2-(y0-4).^2)+ exp(-(x0+4).^2-(y0-4).^2)+2* exp(-(x0).^2-(y0).^2)+2* exp(-(x0).^2-(y0+4).^2);
x=x0-a+2*a*rand(1,p*n);
y=y0-a+2*a*rand(1, p*n);
for i=p*n+1:n
  x(i)=x0+k*( -1+2*rand);
  y(i)=y0+k*( -1+2*rand);
  r=r+1;
  x1(r)=x(i);
  y1(r)=y(i);
end
for i=1: p*n
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
for i=1:n
  ob(i)=exp(-(x(i)-4).^2-(y(i)-4).^2)+ exp(-(x(i)+4).^2-(y(i)-4).^2)+2* exp(-(x(i)).^2-(y(i)).^2)+2* exp(-  (x(i)).^2-(y(i)+4).^2);
end
for i=1:p*n
   for j=1:p*n-1
      if (ob(j)>ob(j+1))
          w1= ob(j);
          ob(j)= ob(j+1);
          ob(j+1)=w1;
          w1= x(j);
          x(j)= x(j+1);
          x(j+1)=w1;
          w1= y(j);
          y(j)= y(j+1);
          y(j+1)=w1;
      end
    end
end
          obbest(r1)= ob(p*n);
          xbest(r1)= x(p*n);
          ybest(r1)= y(p*n);r1=r1+1;
plot(x(p*n), y(p*n),'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','y',...
    'MarkerFaceColor',[0.5,0.5,0.5])
for i=1: (1-open)*n
if (i<=(1-rec)*(1-open)*n)
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0.5,0.5,0.5])
else
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
end
end
for g=1 : itr
r=0;
for j=floor((1-open)*n)+1 : p*n
x0=x(j);y0=y(j); 
m=exp(-(x0-4).^2-(y0-4).^2)+ exp(-(x0+4).^2-(y0-4).^2)+2* exp(-(x0).^2-(y0).^2)+2* exp(-(x0).^2-(y0+4).^2);
x=x0-a+2*a*rand(1,p*n);
y=y0-a+2*a*rand(1, p*n);
for i=p*n+1:n
  x(i)=x0+k*( -1+2*rand);
  y(i)=y0+k*( -1+2*rand);
  r=r+1;
  x1(r)=x(i);
  y1(r)=y(i);
end
for i=1: p*n
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
for i= 1:r
plot(x1(i),y1(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','m',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
for i=1:n
  ob(i)=exp(-(x(i)-4).^2-(y(i)-4).^2)+ exp(-(x(i)+4).^2-(y(i)-4).^2)+2* exp(-(x(i)).^2-(y(i)).^2)+2* exp(-  (x(i)).^2-(y(i)+4).^2);
end
for i=1:p*n
   for j=1:p*n-1
      if (ob(j)>ob(j+1))
          w1= ob(j);
          ob(j)= ob(j+1);
          ob(j+1)=w1;
          w1= x(j);
          x(j)= x(j+1);
          x(j+1)=w1;
          w1= y(j);
          y(j)= y(j+1);
          y(j+1)=w1;
      end
    end
end
          obbest(r1)= ob(p*n);
          xbest(r1)= x(p*n);
          ybest(r1)= y(p*n);r1=r1+1;
plot(x(p*n), y(p*n),'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','y',...
    'MarkerFaceColor',[0.5,0.5,0.5])
for i=1: (1-open)*n
if (i<=(1-rec)*(1-open)*n) 
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0.5,0.5,0.5])
else
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
end
end
end
for g=1 : itr
for j=1 : (1-p)*n+1
x0=x1(j);y0=y1(j); 
m=exp(-(x0-4).^2-(y0-4).^2)+ exp(-(x0+4).^2-(y0-4).^2)+2* exp(-(x0).^2-(y0).^2)+2* exp(-(x0).^2-(y0+4).^2);
x=x0-a+2*a*rand(1,p*n);
y=y0-a+2*a*rand(1, p*n);
for i=p*n+1:n
  x(i)=x0+k*( -1+2*rand);
  y(i)=y0+k*( -1+2*rand);
  r=r+1;
  x1(r)=x(i);
  y1(r)=y(i);
end
for i=1: p*n
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
for i=1:n
  ob(i)=exp(-(x(i)-4).^2-(y(i)-4).^2)+ exp(-(x(i)+4).^2-(y(i)-4).^2)+2* exp(-(x(i)).^2-(y(i)).^2)+2* exp(-  (x(i)).^2-(y(i)+4).^2);
end
for i=1:p*n
   for j=1:p*n-1
      if (ob(j)>ob(j+1))
          w1= ob(j);
          ob(j)= ob(j+1);
          ob(j+1)=w1;
          w1= x(j);
          x(j)= x(j+1);
          x(j+1)=w1;
          w1= y(j);
          y(j)= y(j+1);
          y(j+1)=w1;
      end
    end
end
          obbest(r1)= ob(p*n);
          xbest(r1)= x(p*n);
          ybest(r1)= y(p*n);r1=r1+1;
plot(x(p*n), y(p*n),'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','y',...
    'MarkerFaceColor',[0.5,0.5,0.5])
for i=1: (1-open)*n
if (i<=(1-rec)*(1-open)*n)
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0.5,0.5,0.5])
else
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
end
end
end
for i=1:r1-1
   for j=1:r1-2
      if (obbest(j)>obbest(j+1))
          w1= obbest(j);
          obbest(j)= obbest(j+1);
          obbest(j+1)=w1;
          w1= xbest(j);
          xbest(j)= xbest(j+1);
          xbest(j+1)=w1;
          w1= ybest(j);
          ybest(j)= ybest(j+1);
          best(j+1)=w1;
      end
    end
end
CVA=obbest(r1-1),xCVA=xbest(r1-1),yCVA=ybest(r1-1)