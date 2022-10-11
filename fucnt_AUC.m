
function  [auc,outx,outy]=fucnt_AUC(Hobs,Hsti)



%thd=max(min(Hsti), min(Hsti)):(min(max(Hobs), max(Hsti))-max(min(Hsti), min(Hsti)))./10:min(max(Hobs), max(Hsti));
thd=[min(Hsti):0.3:max(Hsti)];
tp =nan(size(thd));
tn = tp;
fn = tp;
fp = tp;
po = tp;
no = tp;
ps = tp;
ns = tp;
nmiss=tp;

for i = 1:numel(thd)
    [tp(i) tn(i) fn(i) fp(i) po(i) no(i) ps(i) ns(i) nmiss(i)] = roc(Hobs, Hsti, thd(i));
end
fpr = fp./no;
tpr = tp./po;
inan= union(find(isnan(fpr)==1), find(isnan(tpr)==1) );
fpr(inan)=[]
tpr(inan)=[]
% auc = trapz([1 fp./no 0], [1 tp./po 0])
auc = trapz([0 fliplr(fpr) 1], [0 fliplr(tpr) 1])

outx=[0 fliplr(fpr) 1];
outy=[0 fliplr(tpr) 1];
% figure
% hold on
% 
% c={'b','k','y','r'}
% 
% plot([0 fliplr(fpr) 1], [0 fliplr(tpr) 1], '-*k')
% title(num2str(auc))
end


function [tp tn fn fp po no ps ns nmiss] = roc(hobs, hsti, thd)
%

% elimina mancanti
imiss = union(find(isnan(hobs)==1), find(isnan(hsti)==1));
nmiss = numel(imiss);
hobs(imiss)=[];
hsti(imiss)=[];

% calcola quantità matrice di contingenza
tp = sum(and(hobs>thd,hsti>thd));
tn = sum(and(hobs<=thd,hsti<=thd));
fn = sum(and(hobs>thd, hsti<=thd));
fp = sum(and(hobs<=thd, hsti>thd));
po = sum(hobs>thd); % numero di positivi (sull'osservato)
no = sum(hobs<=thd);% numero di negativi (sull'osservato)
ps = sum(hsti>thd);% numero di positivi (sullo stimato)
ns = sum(hsti<=thd);% numero di negativi (sullo stimato)
% verifiche
r1 = tp + fn - po; 
r2 = fp + tn - no;
r3 = tp + fp - ps;
r4 = fn + tn - ns;
if r1 | r2 | r3 | r4 ~= 0
    disp('qualcosa non va')
    pause
end
    
%  r1 r2 r3 r4] 
end