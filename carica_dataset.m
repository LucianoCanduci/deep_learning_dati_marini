function [matrice_u,matrice_v,vettore_tempo]= carica_dataset(input_file, matrice_u,matrice_v,vettore_tempo,riga_di_partenza)
%carico l'input file
data = load(input_file);
%trasferisco le matrici U e V
U_tot=data.U;
V_tot=data.V;
tempo=data.tempo;
%copio U_tot e V_tot su U e V per suddividere i dati in base all'ora
for i=1:8760
    for j=1:1408
    matrice_u(i+riga_di_partenza,j)=U_tot(i,j);
    end

    for j=1:1408
    matrice_v(i+riga_di_partenza,j)=V_tot(i,j);
    end
vettore_tempo(i+riga_di_partenza,1)=tempo(i,1);
end

