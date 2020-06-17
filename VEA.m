DOI: 10.1007/s00521-020-05124-x
Paper Title: Volcano Eruption Algorithm for Solving Optimization Problems
Authors: Eghbal Hosseini, Ali Safa, Kayhan Zrar Ghafoor, Danda B.Rawat, Mehrdad Saif, Xinan Yang
Journal Name: Neural Computing and Applications
Accepted Date: 	03 Jun 2020

&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
Matlab Code of VEA
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

********************Initialization************************
******************************************************
% (xop,yop) is optimal solution
% m is objective function
% (x0,y0) is initial solution 
% k is number of agents
% max is the best solution by VEA
xop=0;yop=0; x0=1.5;y0=-2; 
m=-(x0-4).^2-(y0-4).^2; k=0;ep=0.25;max=-Inf
r=0;P=1;q=-1; n=20;k=0;k1=0;
hold on;
plot(xop,yop,'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])
plot(x0,y0,'--rs',...
    'LineWidth',5,...
    'MarkerSize',5,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0.5,0.5,0.5])



******************** Initial Population*******************
******************************************************
% this part relates to section 4.1, Figure 1 and equation (1) of the paper
for i=1:2
      k=k+1;
      x(k)= x0+ep*i;
     y(k)= y0;
      k=k+1;
      x(k)= x0;
     y(k)= y0+ ep *i;
      k=k+1;
      x(k)= x0- ep *i;
     y(k)= y0+ ep *i;
      k=k+1;
      x(k)= x0- ep *i;
     y(k)= y0;
      k=k+1;
      x(k)= x0- ep *i;
     y(k)= y0- ep *i;
      k=k+1;
      x(k)= x0;
     y(k)= y0- ep *i;
      k=k+1;
      x(k)= x0+ ep *i;
     y(k)= y0- ep *i;
      k=k+1;
      x(k)= x0+ ep *i;
     y(k)= y0+ ep *i;
end
for i=1:k
plot(x(i),y(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',1.5,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end

*************** Explosion of Initial Population*************
******************************************************
% this part relates to section 4.1, Figure 1 and equation (2) of the paper
t=1;i=1;u=1;t1=1;
while(t<5*k)
     x1(t)= x(i);
     y1(t)= y(i)+4*u;
     x2(t1)= x1(t)-0.4*i*u;
     y2(t1)= y1(t)-0.4*i*u;
t1=t1+1; t=t+1; 
     x1(t)= x(i)+3*u;
     y1(t)= y(i)+2*u;
     x2(t1)= x1(t)+0.2*i*u;
     y2(t1)= y1(t)-0.3*i*u;
t1=t1+1; t=t+1;
     x1(t)= x(i)+1*u;
     y1(t)= y(i)+2*u;
     x2(t1)= x1(t)+0.2*i*u;
     y2(t1)= y1(t)-0.1*i*u;
t1=t1+1; t=t+1;
     x1(t)= x(i)-3*u;
     y1(t)= y(i)+2*u;
     x2(t1)= x1(t)-0.2*i*u;
     y2(t1)= y1(t)-0.3*i*u;
t1=t1+1; t=t+1;
     x1(t)= x(i)-1*u;
     y1(t)= y(i)+2*u;
     x2(t1)= x1(t)+0.1*i*u;
     y2(t1)= y1(t)-0.2*i*u;
i=i+1; t=t+1;
end
i=1;
while(t<6*k)
     x1(t)= x(i);
     y1(t)= y(i)+0.4*i*u;
t=t+1;
     x1(t)= x(i)+0.3*i*u;
     y1(t)= y(i)+0.2*i*u;
t=t+1;
     x1(t)= x(i)+0.1*i*u;
     y1(t)= y(i)+0.2*i*u;
t=t+1;
     x1(t)= x(i)-0.3*i*u;
     y1(t)= y(i)+0.2*i*u;
t=t+1;
     x1(t)= x(i)-0.1*i*u;
     y1(t)= y(i)+0.2*i*u;
i=i+1;
end
for i=1:t
plot(x1(i),y1(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
for i=1:t
if(m>max)
    max=m;
     r=i;
  end
end
max
******************** Explosion and Eruption***************************
*******************************************************************
% this part relates to section 4.2, Figure 2 and equations (3), (4) of the paper
for i=1:t1
plot(x2(i),y2(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
k1=k+t;
t=1;i=1;u=1;t1=1;p=1;
while(t<5*k)
p=-p;
     x3(t1)= x1(t)+ p*rand;
     y3(t1)= y1(t)+p*rand;
t1=t1+1; t=t+1; 
     x3(t1)= x1(t)+ p*rand;
     y3(t1)= y1(t)- p*rand;
t1=t1+1; t=t+1;
     x3(t1)= x1(t)- p*rand;
     y3(t1)= y1(t)+ p*rand;
t1=t1+1; t=t+1;
     x3(t1)= x1(t)- p*rand;
     y3(t1)= y1(t)- p*rand;
t1=t1+1; t=t+1;
     x3(t1)= x1(t)+ p*rand;
     y3(t1)= y1(t)+ p*rand;
i=i+1; t=t+1;
end
i=1;
for i=1:t1
plot(x3(i),y3(i),'--rs',...
    'LineWidth',2,...
    'MarkerSize',2,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
end
k1=k1+t1;
X=horzcat(x,x1,x2);Y=horzcat(y,y1,y2);
for i=1:t1
m=-(x3(i)-4).^2-(y3(i)-4).^2;
 if(m>max)
    max=m;
     r=i;
  end
end
x0=x3(r),y0=y3(r),max

