%trasforma i dati di vento in matrici 4D a 3 canali contenenti (U,V,Orografia,indice)

data = load("dataset_completo.mat")
%trasferisco le matrici U e V
U_tot=data.U;
V_tot=data.V;
tempo=data.tempo;
mat_file=matfile('dataset_formattato.mat','Writable',true)
data_o=load("Oreografia.mat");
U=zeros(1,1408);
V=zeros(1,1408);
num_file=11;%numero di file utilizzati 
%copio U_tot e V_tot su U e V per suddividere i dati in base all'ora
for i=1:8760*num_file
    for j=1:1408
    U(j)=U_tot(i,j);
    end
U= reshape(U,[44 32]);
U=transpose(U);
    for j=1:1408
    V(j)=V_tot(i,j);
    end
V=reshape(V,[44 32]);
V=transpose(V);
Totale(:,:,3,i)=data_o.inv_oreografia; 
for h= 1:32
    for k=1:44
        
            Totale(h,k,1,i)=U(h,k);
            Totale(h,k,2,i)=V(h,k);
    end
end

end
mat_file.totale=Totale
mat_file.tempo=tempo