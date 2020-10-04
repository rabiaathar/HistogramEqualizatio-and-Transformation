B1=readimage('i170b1h0_t0.txt');% Read band 1
blue=histogramEqualizatione(B1);% Histogram Equlization of band 1
B2=readimage('i170b2h0_t0.txt');% Read band 2
partAtoD(B2);%this function is is used to find MIN,MAX,MEAN,Variance, draw profile line and transformation of the band 2.
alpha=histogramEqualizatione(B2);% Histogram Equlization of band 2
B3=readimage('i170b3h0_t0.txt'); % Read band 3
green=histogramEqualizatione(B3);% Histogram Equlization of band 3
B4=readimage('i170b4h0_t0.txt'); % Read band 4
red=histogramEqualizatione(B4);% Histogram Equlization of band 4
figure
subplot(2,2,1);
imshow(blue,[]);title('i170b1h0-t0');% Display band 1 aftre Histogram Equalization
subplot(2,2,2);
imshow(alpha,[]);title('i170b2h0-t0');% Display band 2 aftre Histogram Equalization
subplot(2,2,3);
imshow(green,[]);title('i170b3h0-t0');% Display band 3 aftre Histogram Equalization
subplot(2,2,4);
imshow(red,[]);title('i170b4h0-t0');% Display band 4 aftre Histogram Equalization
%Creating RGB image of R=4,G=3,B=1 bands
row=500; col=500;
rgbImage=zeros(row,col,3);
for i=1:row 
    for j=1:col
       rgbImage(i,j,1)=red(i,j); 
       rgbImage(i,j,2)=green(i,j); 
       rgbImage(i,j,3)=blue(i,j); 
    end
end
figure
imshow(rgbImage);title('RGB image as R=4,G=3,B=1 bands');axis on
