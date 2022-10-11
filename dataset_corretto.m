%effettua l'interpolazione dei dati di boa mancanti

%carico i dati necessari
dati_vento=load("dataset_formattato.mat");
dati_boa=load("dataset_limitato.mat");
%interpolazione dei dati passando da dati ogni 3 ore a dati ogni ora(ove è necessario)
Hs_interp=interp1(dati_boa.data,dati_boa.Hs,dati_vento.tempo,'linear');
Dir_interp=interp1(dati_boa.data,dati_boa.Dir,dati_vento.tempo,'linear');
Tm_interp=interp1(dati_boa.data,dati_boa.Tm,dati_vento.tempo,'linear');
Tp_interp=interp1(dati_boa.data,dati_boa.Tp,dati_vento.tempo,'linear');
plot(dati_vento.tempo,Hs_interp,'o',dati_boa.data,dati_boa.Hs,'r')
%caricamento dei dati interpolati all'interno del file
mat_file = matfile('dati_boa_interp.mat','Writable',true)
mat_file.Hs=Hs_interp;
mat_file.Dir=Dir_interp;
mat_file.Tm=Tm_interp;
mat_file.Tp=Tp_interp;
mat_file.tempo=dati_vento.tempo;