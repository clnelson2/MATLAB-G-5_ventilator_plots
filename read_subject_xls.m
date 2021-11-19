function [ subject ] = read_subject_xls( varargin )
%READ_SHEEP_XLS -this function enables you to read the data into 
%   Detailed explanation goes here
name=char(varargin(1));
start_time=char(varargin(2));
d=[];
for i=3:nargin
    fname=char(varargin(i));
    read_data=importdata(fname);
    dtemp=read_data.data;
    if isfield(dtemp,'Sheet1')
        d1=read_data.data.Sheet1;
    else
        d1=dtemp;
    end
    d=[d;d1];
end
htemp=read_data.textdata;
if isfield(htemp,'Sheet1')
        header=read_data.textdata.Sheet1;
    else
        header=htemp;
end
for i=1:size(header,1)
    if strcmp(char(header(i,1)),'Date')
        for j=1:size(header,2)
            if strcmp(char(header(i,j)),'HH:MM:SS')
                t=d(:,j-1);
            elseif strcmp(char(header(i,j)),'P peak (cmH2O)')
                subject.p_peak=d(:,j-1);
            elseif strcmp(char(header(i,j)),'Cstat (ml/cmH2O)')
                subject.C_stat=d(:,j-1);
            elseif strcmp(char(header(i,j)),'SpO2 (%)')
                subject.SpO2=d(:,j-1);
            elseif strcmp(char(header(i,j)),'PetCO2 (mmHg)')
                subject.PetCO2=d(:,j-1);
            elseif strcmp(char(header(i,j)),'Insp flow (l/min)')
                subject.Inspflowlmin=d(:,j-1);
            elseif strcmp(char(header(i,j)),'Rinsp (cmH2O/l/s)')
                subject.Rinspcm_H20_l_s=d(:,j-1);
            elseif strcmp(char(header(i,j)),'Rexp (cmH2O/l/s)')
                subject.RexpcmH2O_l_s=d(:,j-1);
            elseif strcmp(char(header(i,j)),'VTI (ml)')
                subject.VTI=d(:,j-1);
            elseif strcmp(char(header(i,j)),'VTE (ml)')
                subject.VTE=d(:,j-1);
            elseif strcmp(char(header(i,j)),'f cmv (b/min)')
                subject.f_cmv_b_min=d(:,j-1);
            elseif strcmp(char(header(i,j)),'WOB (J/l)')
                subject.WOB_J_l=d(:,j-1);
            elseif strcmp(char(header(i,j)),'f total (b/min)')
                subject.f_total_b_min=d(:,j-1);
            elseif strcmp(char(header(i,j)),'P mean (cmH2O)')
                subject.P_mean_cmH2O=d(:,j-1);
            elseif strcmp(char(header(i,j)),'P plateau (cmH2O)')
                subject.P_plateau_cmH2O=d(:,j-1);
            elseif strcmp(char(header(i,j)),'AutoPEEP (cmH2O)')
                subject.AutoPEEP_cmH2O=d(:,j-1);
            elseif strcmp(char(header(i,j)),'Peep (cmH2O)')
                subject.PEEP_cmH2O=d(:,j-1);
            elseif strcmp(char(header(i,j)),'Oxygen (%)')
                subject.Oxygen=d(:,j-1);
            elseif strcmp(char(header(i,j)),'ExpMinVol (l/min)')
                subject.ExpMinVol_l_min=d(:,j-1);
            elseif strcmp(char(header(i,j)),'Vt leak (ml)')
                subject.Vt_leak_ml=d(:,j-1); 
            elseif strcmp(char(header(i,j)),'PEEP/CPAP (cmH2O)')
                subject.PEEP_CPAP_cmH2O=d(:,j-1);
            elseif strcmp(char(header(i,j)),'Pinsp (cmH2O)')
                subject.Pinsp_cmH2O=d(:,j-1); 
                                 
            end
        end
        
        break
    end
end

% %start_time='16:00:00';
fixed_t=fix_time(t,start_time);
subject.name=name;
subject.time=fixed_t;

end

