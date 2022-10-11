%utilizzato per ridurre il dataset della boa fino all'anno che si vuole
%considerare(partendo dal 1989)

dati_boa=load("mazara-del-vallo.mat");
[Yi,Mi,Di,Hi,MNi] = datevec(dati_boa.data);
%seleziono fino a che anno considerare
anno=1999;%era 1995
%ricavo l'indice al quale fermarci
for i=1:160220 
    if Yi(i)==anno
    fine=i;
    end
end
for i=1:fine
    dati_finale_hs(i)=dati_boa.Hs(i);
    dati_finale_data(i)=dati_boa.data(i);
    dati_finale_Dir(i)=dati_boa.Dir(i);
    dati_finale_Tm(i)=dati_boa.Tm(i);
    dati_finale_Tp(i)=dati_boa.Tp(i);
end
%trasformo i vettori riga e in vettori colonna 
dati_finale_hs=transpose(dati_finale_hs);
dati_finale_data=transpose(dati_finale_data);
dati_finale_Dir=transpose(dati_finale_Dir);
dati_finale_Tm=transpose(dati_finale_Tm);
dati_finale_Tp=transpose(dati_finale_Tp);
%creo un nuovo file nel quale salverò il nuovo dataset
mat_file=matfile('dataset_limitato.mat','Writable',true)
mat_file.Hs=dati_finale_hs;
mat_file.data=dati_finale_data;
mat_file.Dir=dati_finale_Dir;
mat_file.Tm=dati_finale_Tm;
mat_file.Tp=dati_finale_Tp;


