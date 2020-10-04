function B=read(input)
format=repmat('%s',1,500);
f = fopen(input);
c = textscan(f,format,'delimiter',',');
fclose(f);
B = [c{:}];
B=strrep(B,'"','');
B=strrep(B,'E','e');
B=str2double(B);
B=flipud(B);
end