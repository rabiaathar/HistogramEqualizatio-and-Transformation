function partAtoD(B)
row=500;
col=500;
figure
subplot(1,3,1)
imshow(B,[]);title('Original Image(i170b2h0-t0)');axis on
subplot(1,3,2)
imshow(B,[]);title('i170b2h0-t0 Image with blue MAX data line');axis on

% PART (a)
%MAX
maxbefore=max(B(:));
%MIN
MIN=min(B(:));
%Mean
meanOfImage=mean(B(:));
%Variance
varianceOfImage=var(single(B(:)));

fid = fopen('output.txt','w');
fprintf(fid,'Band 2\n');
fprintf(fid, 'MAX:'); % writing MAX value to file
fprintf(fid,'%f\n',maxbefore);
fprintf(fid, 'MIN:'); % writing MIN value to file
fprintf(fid,'%f\n',MIN);
fprintf(fid, 'Mean:'); % writing MEAN value to file
fprintf(fid,'%f\n',meanOfImage);
fprintf(fid, 'Var:'); % writing  VARIANCE value to file
fprintf(fid,'%f\n',varianceOfImage);
fclose(fid);

% PART (b)
%Profile line
[r,c] = find(B==maxbefore);
line([col 1], [r r])
X=1 : col;
Y=B(r,:);
subplot(1,3,3)
plot(X, Y, 'b-');title('Profile line of the MAX data line');xlabel('X');ylabel('Y');
legend({'profile line'},'Location','northeast');

% PART (c)
%Line Grah
values = unique(B);
frequencies = [values,histc(B(:),values)];
figure
subplot(1,3,2)
ln=plot(frequencies(:,1),frequencies(:,2));title('Line graph of Histogram of i170b2h0-t0');xlabel('Occurences');ylabel('Frequencies');
ln.LineWidth = 4;
ln.Color = [0 0.5 0.5];
legend({'Line Graph'},'Location','northeast');

% PART (d)
%NON-LINEAR g(m,n) = (255/64)log (f(m,n) + 1) Refrence https://www.cse.unr.edu/~looney/cs674/unit2/unit2.pdf
r2=[500 500];
c=255/64;
for i=1:row
    for j=1:col
       r2(i,j)=c*log2(B(i,j)+1);
    end
end

subplot(1,3,1)
imshow(B,[]); title('Original Image (i170b2h0-t0)');axis on
subplot(1,3,3)
imshow(r2,[]); title('Image after Non-Linear Transformation');axis on

end