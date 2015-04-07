[x,y]=meshgrid(-2:0.2:2);
z=x.^2+y.^2
mesh(x,y,z)
figure(2)
contour(z,10)
figure(3)
theta=0:0.01:2*pi;
polar(theta)
