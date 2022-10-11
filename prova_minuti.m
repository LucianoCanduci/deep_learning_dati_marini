dati_boa=load("dataset_limitato.mat");
[r c] = size(dati_boa.data)
[Y M D H MN S]=datevec(dati_boa.data);
j=1;
limite_ore=6;
for i=1:r
if MN(i)~=30
    Vett_corretto(j)=dati_boa.data(i);
j=j+1;
end
end
Vett_corretto=transpose(Vett_corretto);