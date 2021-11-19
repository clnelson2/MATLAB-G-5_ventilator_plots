%scupa data
clear
subject1=read_subject_xls('ALI1','12:00:00','ALI-1/V-1.xlsx');
subject2=read_subject_xls('ALI2','12:00:00','ALI-2/V-1.xlsx');
subject3=read_subject_xls('ALI3','10:45:00','ALI-3/V-1.xlsx');
subject4=read_subject_xls('Normal4','10:45:00','Normal-4/V-1.xlsx');

vent_filt=vent_filt(subject1);


%divisibles section

subject654.VTE_over_C_stat=[subject654.VTE]./[subject654.C_stat];


%save subject_data