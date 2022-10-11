
[righe colonne]=size(Vett_corretto);
for i=1:righe-1

diff_ore_tot(i)=etime(datevec(Vett_corretto(i+1)),datevec(Vett_corretto(i)))/3600;
end
j=1;
limite_ore=6;
for i=1:righe-1
if diff_ore_tot(i)>limite_ore 
    T(j)=i;
j=j+1;
end
end