function [ subject_means ] = plot_subject_mean_line( field_name,linecolor,varargin )
%PLOT_subject_MEANS Summary of this function goes here
%   Detailed explanation goes here

%% varargin - variable number of arguments in,
%  which means you can pass it as many subjects as you want.
num_subject=nargin-2; %nargin is the number of arguments, in this case the number of subjects

for i=1:num_subject %loop through number of subject
    tmin(i)=min(varargin{i}.time(1:length(varargin{i}.(field_name)))); %look at the current subjects in the loop.
    tmax(i)=max(varargin{i}.time(1:length(varargin{i}.(field_name))));
end

%after that loop, we should have a min and max time for which all subject
%have data

t_mean=min(tmin):max(tmax); %make a time vector from tmin to tmax, stepping 1 sec (the 1 is implicit, if you wanted to do every 2 sec, do tmin:2:tmax)
for i=1:length(t_mean)
    numinavg=0;
    for j=1:num_subject
        if t_mean(i) >= tmin(j) && t_mean(i) <= tmax(j)
            numinavg=numinavg+1;
        end
        linethick(i)=numinavg;
    end
end


for i=1:num_subject %loop though number of subject
    subject=varargin{i}; %get the current subject 
    %interpolate to make sure we have data points for each subject occuring
    %at the same time points so we can average
    %putting the interpolated values into a 2D array to a
    %current row
    sdata(i,:)=interp1(subject.time(1:length(subject.(field_name))),subject.(field_name),t_mean);

end
for i=1:length(t_mean)
    temp=0;
    for j=1:num_subject
        if ~isnan(sdata(j,i))
            temp=temp+sdata(j,i);
        end
        
    end
    mean_sdata(i)=temp/linethick(i);
end
            

subject_means.time=t_mean;

subject_means.(field_name)=mean_sdata;
subject_means.subject_in_mean=linethick;

for i=1:max(linethick)
    hline(i)=plot(t_mean(linethick>=i)/3600,mean_sdata(linethick>=i),'Linewidth',i,'Color',linecolor)
    %plot(t_mean(linethick>=i)/3600,mean_sdata(linethick>=i),'Linewidth',i)
hold on
end
subject_means.hline=hline(1);
end
