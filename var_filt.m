function [ filt_var ] = var_filt( t,v,w )
%VAR_FILT Summary of this function goes here
%   Detailed explanation goes here

% =w; %pO window. pO is randomly assigned label
% %make a filtered variable
% for i=1:length(v)-pO
%     filt_var(i)=sum(v(i:i+pO-1))/pO;
% end

pO=w; %Po window- randomly assigned label
%make a filtered variable
j=1;
for i=1:length(v)
    if ~isnan(v(i))
        vf(j)=v(i);
        tf(j)=t(i);
        j=j+1;
    end   
end

for i=1:length(vf)
filt_var(i)=sum(vf(tf>=tf(i) & tf<(tf(i)+pO)))/sum(tf>=tf(i) & tf<(tf(i)+pO));
end

end

