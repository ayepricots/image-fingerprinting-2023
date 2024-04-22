function DispFP(fingerprint)
% DISPFP displays the image fingerprint in a pretty format on one line
%
% Input: A 1-by-𝑛 logical row vector representing an image fingerprint.
% Output: None.
%
% Author: Aye Thu

% loop over the length of input to format the vector in multiples of 8
for i = 1:8:length(fingerprint)
    % if the last set of values can't be grouped in a multiple of 8, group
    % remaining values in a multiple thats not 8 then end script.
    if length(fingerprint) - i < 8
        fprintf('%i',fingerprint(i:length(fingerprint)))
        fprintf('\n')
        return
    else 
        fprintf('%i',fingerprint(i:i+7))
        fprintf(' ')
    end
end

end