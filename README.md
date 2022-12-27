# Automated Visualization of Pulmonary Function using MATLAB
The MATLAB code as posted allows for representation of ventilator dynamics, with running average filters to reduce outlier data, and output additionally offers visual tool to analyze progression of lung function and/or injury.
Datasets are also available for testing code as posted here.
To operate these scripts, MATLAB R2015b or higher is required. Optional Statistical Analysis Toolboxes are required, if statistical analysis is desired between groups. Parallel Computing Toolbox is required to run parallel computing in ‘import_subject_files.m’ function. This can otherwise be commented out.

These scripts are tailored to use the data output files of the Hamilton G5 ventilator, as recorded by Hamilton Datalogger v5.0 (©HAMILTON MEDICAL AG, 2011), subsequently changed from .txt to .xlsx. This program is available from Hamilton, for research purposes. While this particular script is tailored for the specific usage of the Hamilton G5 ventilator, output from Datalogger, it can be adapted for any other mechanical ventilator use and subsequent data files as well, if available.

Ventilator data is output into a .txt file by Datalogger. Data will need to be changed into an excel file (monotonically), and saved with named description, as desired. Organize files into folders with description of the subject or condition for reference, and the excel file contained therein, titled ‘V-1’. For our example, in ‘subject1’:

· ALI1

o V-1

In ‘import_subject_files.m’, manually enter the following for individual experimental conditions, under description for ‘subject1’:

Example:('ALI1','12:00:00','ALI-1/V-1.xlsx')

Description: (‘parent folder’,’time monitoring period began (hh:mm:ss)’ ‘parent folder/excel file’)

Run ‘import_subject_files.m’ script once folder organization is complete. At this point, the importation of data into your workspace will consist of both raw data, and data that has been filtered and interpolated in the case of ‘Nans’. Filtering in this script is tailored to the use of an experimental animal model (with excess 'noise' data points). Depending on application, filtering can be adjusted to more or less sensitivity in data reduction.

import_subject_files.m script consists of three sections, the initial ‘read_subject_xls.m’ is used to read selected data points out of named folders, and import these sections as raw data into your workspace. read_subject_xls.m will skip variables that may or may not be included in experimental design, such as optional sensors, or differences in various ventilator modes. All data points are not included due to redundancy, or lack of experimental relevance, but can be added in. The initial section will also consist of the vent_filt.m function; that filters variables to eliminate artefacts and will save these into your workspace.

The remaining two sections are examples of graphical data exports that can be used -one example in which individual subject variables are plotted, for this example the interplay between resistance and pressure variables; and the last section contains an example of group analysis. In this example, non-clinical models of acute lung injury (ALI), are displayed as a mean trend line as compared to a single example of a normal physiological pulmonary function.

Scripts Contained:

1. import_subject_files.m Datasets are read into workspace using read_subject_xls, are then subsequently filtered using vent_filt, at which point graphs of filtered trend lines are plotted using plot_subject_mean. This function requires manually entering file folders to be analyzed, (example data is shown in script) and manually inputting desired variables to be plotted, if different from examples shown. Specifics of study designs and analysis desired would be too numerous to detail all.

2. fix_nans.m: For measurements in which sensors were obstructed, or other interference in the recording of continuous data, function interpolates for ‘Nans’ (not a number)
3. fix_time.m: Data is output originally into an uncommon time format (seconds per day, in decimals), and function changes this into a standard format for comparison individually and between groups.

4. plot_subject_mean_file.m Script allows for individual interpolation to estimate data points for each subject, sets interpolated values into a 2D array.

5. read_subject_xls.m Function imports 21 physiologically important variables into workspace for analysis; however this is not exhaustive of all data recorded, and can be expanded. Variables extracted from data are as follows:

· ‘P peak (cmH2O)'

· 'Cstat (ml/cmH2O)'

· 'SpO2 (%)'

· 'PetCO2 (mmHg)'

· 'Insp flow (l/min)'

· 'Rinsp (cmH2O/l/s)'

· 'Rexp (cmH2O/l/s)'

· 'VTI (ml)’

· 'VTE (ml)'

· 'f cmv (b/min)'

· 'WOB (J/l)’

· 'f total (b/min)'

· 'P mean (cmH2O)'

· 'P plateau (cmH2O)'

· 'AutoPEEP (cmH2O)'

· 'Peep (cmH2O)'

· 'Oxygen (%)'

· 'ExpMinVol (l/min)'

· 'Vt leak (ml)')

· 'PEEP/CPAP (cmH2O)'

· 'Pinsp (cmH2O)'

Times are fixed to standard formats, and in addition customized variables such as ‘Driving Pressure Force’, or ‘Peak/Compliance’ that are not available 'bedside' are imported into workspace for analysis. Additional examples of further potential custom variables are included to build upon, per research need, in comments.

6. var_filt.m Script allows for the output of customized filtered variables based upon the ‘windows’ of data available.

7. vent_filt.m Script allows for customized filtering/data reduction, and saves data in workspace as ‘_filt’. In this function, the end number in parentheses can be customized based on experimental needs. In this current example, filters are tailored for this model. Vent_filt will run through datasets as available, and if not present or not enough data to run function will output customized display message for subjects.
