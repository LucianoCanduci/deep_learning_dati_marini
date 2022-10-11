# deep_learning_dati_marini
Analisi e predizione di serie temporali in ambito marino tramite tecniche di deep learning

file di partenza utilizzati:
///////////////////////
mazara-del-vallo.mat
dataset_1989.mat
dataset_1990.mat
dataset_1991.mat
dataset_1992.mat
dataset_1993.mat
dataset_1994.mat
dataset_1995.mat
dataset_1996.mat
dataset_1997.mat
dataset_1998.mat
dataset_1999.mat
settore_traversia.mat(creare usando script: oreografia.m)
/////////////////////


1) Aprire unisci_dataset.m, scrivere il percorso dei file da caricare relativi ai dati forniti dall'ECMWF(ERA5).
   per il caricamento viene utilizzata la funzione carica_dataset.m
2) Avvia formatta_dataset.m per costruire le matrici di dati
3) Avvia limita_dataset.m per scegliere fino a che anno considerare i dati della boa
4) Avvia dataset_corretto.m per interpolare i dati di boa mancanti
5) Avvia 3 volte(senza eliminare il workspace generato) dati_sincronizzati.m per ottenere il dataset completo e sincronizzato tra target e ingressi
6) Avvia script_reti_utilizzate.mlx per testare il dataset con: LSTM,Network1,Network2,Network3,Network4.
   in (Parametri) si trovano tutti gli indici di performance sul dataset di test e train 
7) Avvia plot_grafici.mlx per plottare i grafici relativi ai dataset di train e test
   nota:se flag.piu_prove=1 è possibile anche utilizzare i parametri ottenuti per creare dei bloxplot con altre prove 
