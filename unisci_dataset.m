%creo le matrici per contenere U,V,tempo
num_file=11; %(era 7)dal 1989 al 1999
righe_mat_totali=num_file*8760;
U= zeros(righe_mat_totali,1408);
V= zeros(righe_mat_totali,1408);
tempo =zeros(righe_mat_totali,1);

%carico i file nelle matrici U,V,tempo
[U,V,tempo]=carica_dataset('dataset_1989.mat',U,V,tempo,0);
i=8760;%indice utilizzato come riferimento per il caricamento dei dati nelle matrici totali(8760=campioni in un file(anno))
[U,V,tempo]=carica_dataset('dataset_1990.mat',U,V,tempo,i);
i=8760*2;
[U,V,tempo]=carica_dataset('dataset_1991.mat',U,V,tempo,i);
i=8760*3;
[U,V,tempo]=carica_dataset('dataset_1992.mat',U,V,tempo,i);
i=8760*4;
[U,V,tempo]=carica_dataset('dataset_1993.mat',U,V,tempo,i);
i=8760*5;
[U,V,tempo]=carica_dataset('dataset_1994.mat',U,V,tempo,i);
i=8760*6;
[U,V,tempo]=carica_dataset('dataset_1995.mat',U,V,tempo,i);
i=8760*7;
[U,V,tempo]=carica_dataset('D:\Documenti\Universita\DATASET\dati_estratti\dataset_1996.mat',U,V,tempo,i);
i=8760*8;
[U,V,tempo]=carica_dataset('D:\Documenti\Universita\DATASET\dati_estratti\dataset_1997.mat',U,V,tempo,i);
i=8760*9;
[U,V,tempo]=carica_dataset('D:\Documenti\Universita\DATASET\dati_estratti\dataset_1998.mat',U,V,tempo,i);
i=8760*10;
[U,V,tempo]=carica_dataset('D:\Documenti\Universita\DATASET\dati_estratti\dataset_1999.mat',U,V,tempo,i);
%i=8760*11;
%carica_dataset('2000.mat',U,V,tempo,i);

%creo un file per immagazzinare le matrici complete
mat_file=matfile('dataset_completo.mat','Writable',true)
mat_file.U=U;
mat_file.V=V;
mat_file.tempo=tempo;