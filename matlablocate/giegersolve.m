function [newx,newy,newz,newt]=giegersolve(x,y,z,t,to,stax,stay)
dx=1;
dy=1;
%dz=1;
num=length(to)/2;
r=convert2r(x,y,stax,stay);
for i=1:num
    [te(2*i-1),te(2*i)]=simptime(r(i),z);
end
te=te+t;
deltar=to-te;
A=ones(2*num,3);
drx=convert2r(x+dx,y,stax,stay)-convert2r(x,y,stax,stay);
dry=convert2r(x,y+dy,stax,stay)-convert2r(x,y,stax,stay);
for i=1:num
    [dt3,dt4]=simptime(r(i),z);
    for j=1:2
        if j==1
            [dt1,dt2]=simptime(r(i)+drx(i),z);
            A(2*i-1,j)=(dt1-dt3)./dx;
            A(2*i,j)=(dt2-dt4)./dx;
        end
        if j==2
            [dt1,dt2]=simptime(r(i)+dry(i),z);
            A(2*i-1,j)=(dt1-dt3)./dy;
            A(2*i,j)=(dt2-dt4)./dy;
        end
        %{
        if j==3
            [dt1,dt2]=simptime(r(i),z+dz);
            A(2*i-1,j)=(dt1-dt3)./dz;
            A(2*i,j)=(dt2-dt4)./dz;
        end
        %}
    end
end
b=A\deltar';
newx=b(1)+x;
newy=b(2)+y;
newz=z;
newt=b(3)+t;
