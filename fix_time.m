function [ fixed_t ] = fix_time( t, start_time )
%FIX_TIME Fix the time vector from the spreadshets
%   Inputs:
%     t: Time vector from spreadsheet
%     start_time: Time of injury as a time string. Use 24 hour clock with
%       quotes, e.g. '13:00:00'
%   Outputs:
%     fixed_t: Number of seconds since injury time.
ts=t*86400; %number of seconds in a day

start_time_sec=(datenum(start_time)-datenum('00:00:00'))*86400;

ts=ts-start_time_sec;

for i=2:length(ts)
    if ts(i)<ts(i-1)
        ts(i:end)=ts(i:end)+86400;
    end
end

fixed_t=ts;
end

