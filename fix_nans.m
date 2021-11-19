function [ fixed_x ] = fix_nans( x )
%FIX_NANS Summary of this function goes here
%   Detailed explanation goes here

for i=2:length(x)
    if isnan(x(i))
        x(i)=x(i-1);
    end
end
fixed_x=x;
end

