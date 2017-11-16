function geninput
nexample=1000;
stalng=[414940,385422,393217,400846,404426,410431,413554,404100,401628,413430,...
411615,414013,423030,424239,420414,413430,414940,385422,413430,404100,410618,...
400846,420309,411611,421600,404943,420414,413430,393152,394333,384850,405034,...
420104,404426,395400,410431,411333];
stalat=[1233441,1213742,1211623,1242327,1244651,1210820,1214541,1223609,1231534,...
    1202912,1234647,1242439,1232349,1241913,1225204,1232440,1233441,1213742,...
    1202912,1223609,1230045,1242327,1213555,1231709,1235446,1195237,1225204,...
    1232440,1225839,1225806,1211351,1224856,1251903,1244651,1233536,1210820,1192538];
stalng=floor(stalng./10000)+mod(floor(stalng./100),100)/60+mod(stalng,100)/3600;
stalat=floor(stalat./10000)+mod(floor(stalat./100),100)/60+mod(stalat,100)/3600;
tt=stalat;
stalat=stalng;
stalng=tt;
stax=111.199*(stalat-stalat(1)).*cos((stalng+stalng(1))/2);
stay=111.199*(stalat-stalat(1));
stax=stax([3,5,6,7,8,9,12,17,22,27]);
stay=stay([3,5,6,7,8,9,12,17,22,27]);
sourcedeep=5+30*rand(nexample,1);
t=-120+240*rand(nexample,1);
sourcex=-500+1000*rand(nexample,1);
sourcey=-500+1000*rand(nexample,1);
for i=1:length(stax)
    for j=1:nexample
        r=convert2r(sourcex(j),sourcey(j),stax,stay);
        [te(j,2*i-1),te(j,2*i)]=simptime(r(i),sourcedeep(j));
        te(j,2*i-1)=te(j,2*i-1)+randn;
        te(j,2*i)=te(j,2*i)+randn;
    end
end
te=te+t;
contents=[te,sourcex,sourcey,sourcedeep,t];
f='/Users/siqilu/Desktop/datainput/testinput.txt';
dlmwrite(f,contents,'delimiter','\t');