function band=histogramEqualizatione(B)
row=500; col=500;
%PDF
values = unique(B);
frequencies = [values,histc(B(:),values)];
counts=frequencies(:,2);
indexes=frequencies(:,1);
PDF=[size(counts)];
t=row*col;
for i=1:size(counts)
    PDF(i)= counts(i)/t;
end

%CDF
CDF=zeros(size(indexes));
CDF(1)=PDF(1);
for i=2:size(indexes)
    CDF(i)=PDF(i)+CDF(i-1);
end
maximum=double(255);
for i=1:size(PDF)
    CDF(i)=round(CDF(i)*maximum);
end
% Updateing the image values
newimage=zeros(row,col);
for i=1:row
    for j=1:col
        index=indexes==B(i,j);% get index of the pixel as (r) 
        newimage(i,j)=CDF(index);%get the CDF value of (r) and update the value
    end
end
band=newimage;
end
%figure
%subplot(1,3,1)
%imshow(B,[]);title('Original Image');axis on
%subplot(1,3,2)
%imshow(newimage,[]);title('Normalized Image');axis on
%subplot(1,3,2)
%histogram(band(:));title('Histogram of Normalized Image');
