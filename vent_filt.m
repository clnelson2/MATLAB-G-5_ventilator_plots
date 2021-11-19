function [ vent_filt ] = vent_filt( subject )
%vent_filt Summary: VENT FILT uses the var_filt, running average filter, in
%order to eliminate artifacts in data. 
%   Vent_filt can be adjusted to specific data needs, for example in order
%   to more aggressively filter (subject.time,subject.RexpcmH2O_l_s,50),
%   you would change the end digits correspondingly, for example:
%   "RexpcmH2O_l_s,100", which would increase filter two times.


vent_filt=subject;

vent_filt.RexpcmH2O_l_s_filt=var_filt(subject.time,subject.RexpcmH2O_l_s,50)';
vent_filt.WOB_J_l_filt=var_filt(subject.time,subject.WOB_J_l,10)';
vent_filt.p_peak_filt=var_filt(subject.time,subject.p_peak,150)';
vent_filt.C_stat_filt=var_filt(subject.time,subject.C_stat,100)';
try
vent_filt.SpO2_filt=var_filt(subject.time,subject.SpO2,20)';
catch
vent_filt.PetCO2_filt=var_filt(subject.time,subject.PetCO2,200)';
vent_filt.Inspflowlmin_filt=var_filt(subject.time,subject.Inspflowlmin,1000)';
vent_filt.Rinspcm_H20_l_s_filt=var_filt(subject.time,subject.Rinspcm_H20_l_s,100)';
vent_filt.VTI_filt=var_filt(subject.time,subject.VTI,100)';
vent_filt.VTE_filt=var_filt(subject.time,subject.VTE,100)';
vent_filt.VTE_over_C_stat_filt=var_filt(subject.time,subject.VTE_over_C_stat,100)';
vent_filt.P_mean_cmH2O_filt=var_filt(subject.time,subject.P_mean_cmH2O,100)';
try
vent_filt.P_plateau_cmH2O_filt=var_filt(subject.time,subject.P_plateau_cmH2O,100)';
catch
vent_filt.AutoPEEP_cmH2O_filt=var_filt(subject.time,subject.AutoPEEP_cmH2O,150)';
vent_filt.ExpMinVol_l_min_filt=var_filt(subject.time,subject.ExpMinVol_l_min,150)';
vent_filt.Vt_leak_ml_filt=var_filt(subject.time,subject.Vt_leak_ml,150)';
vent_filt.PEEP_CPAP_cmH2O_filt=var_filt(subject.time,subject.PEEP_CPAP_cmH2O,150)';
vent_filt.Pinsp_cmH2O_filt=var_filt(subject.time,subject.Pinsp_cmH2O,150)';


end


end
