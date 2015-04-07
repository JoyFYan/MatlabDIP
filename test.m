I=imread('tank01.bmp');
G=imread('tank02.bmp');
[i j]=size(I);
%uint8 k=zeros(i,j);
for m=1:i
    for n=1:j
        if I(m,n)<G(m,n)
            I(m,n)=I(m,n);
        else 
            I(m,n)=G(m,n);
        %k(m,n)=min(I(m,n),G(m,n));
        end
    end
end
imshow(I,[200 492])