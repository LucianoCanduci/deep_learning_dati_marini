%effettua la sincronizzazione dei dataset riferiti alle immagini e alla boa

%carica i file necessari
dati_vento=load("dataset_formattato.mat"); 
%dati_boa=load("dataset_limitato.mat");
dati_interp=load("dati_boa_interp.mat");
%--------------
limite_ore=6;%imposto il limite di ore massimo di assenza di dati
indice_tempo=4345;%sincronizza l'inizio dei dati di vento (1 luglio 1989)
[righe_I colonne_I]=size(dati_vento.tempo);
prova_minuti %elimina tutti i campioni presi ogni mezzora generando il Vett_corretto
[righe colonne]=size(Vett_corretto);
verifica_temporale %crea il vettore T contenenti gli indici ove viene superato limite_ore
[righe_T colonne_T]=size(T);
j=1;
for i=1:colonne_T
    
   while etime(datevec(dati_vento.tempo(indice_tempo)),datevec(Vett_corretto(T(i))))~=0 && indice_tempo<righe_I 
       %vengono sincronizzati i dati di vento con i dati della boa
        
            Tempo(j)= dati_vento.tempo(indice_tempo);
            Vento(:,:,:,j)=dati_vento.totale(:,:,:,indice_tempo);
            Hs(j)=dati_interp.Hs(indice_tempo);
            Tp(j)=dati_interp.Tp(indice_tempo);
            Tm(j)=dati_interp.Tm(indice_tempo);
            Dir(j)=dati_interp.Dir(indice_tempo);
            j=j+1;
        
        indice_tempo=indice_tempo+1;
   end
  
   if indice_tempo<righe_I %copia l'elemento subito dopo la fine del ciclo precendente
   
        Tempo(j)= dati_vento.tempo(indice_tempo);
        Vento(:,:,:,j)=dati_vento.totale(:,:,:,indice_tempo);
        Hs(j)=dati_interp.Hs(indice_tempo);
        Tp(j)=dati_interp.Tp(indice_tempo);
        Tm(j)=dati_interp.Tm(indice_tempo);
        Dir(j)=dati_interp.Dir(indice_tempo);
        j=j+1;
   
    indice_tempo=indice_tempo+1;
   end   
   
   while etime(datevec(dati_vento.tempo(indice_tempo)),datevec(Vett_corretto(T(i)+1)))~=0 && indice_tempo<righe_I 
       %serve a ricercare il nuovo indice dal quale partire dopo l'interruzione
   indice_tempo=indice_tempo+1;
   end
    
end

 for t=T(i):colonne+1  %copia gli ultimi elementi dopo l'ultimo salto
     
        Tempo(j)= dati_vento.tempo(indice_tempo);
        Vento(:,:,:,j)=dati_vento.totale(:,:,:,indice_tempo);
        Hs(j)=dati_interp.Hs(indice_tempo);
        Tp(j)=dati_interp.Tp(indice_tempo);
        Tm(j)=dati_interp.Tm(indice_tempo);
        Dir(j)=dati_interp.Dir(indice_tempo);
        j=j+1;
    
    indice_tempo=indice_tempo+1;
 end

Tempo=transpose(Tempo);  
Hs=transpose(Hs);
Tm=transpose(Tm);  
Tp=transpose(Tp);
Dir=transpose(Dir);  
mat_file = matfile('Dataset_sincronizzato.mat','Writable',true)
mat_file.time = Tempo;
mat_file.Vento=Vento;
mat_file.Hs=Hs;
mat_file.Tp=Tp;
mat_file.Tm=Tm;
mat_file.Dir=Dir;