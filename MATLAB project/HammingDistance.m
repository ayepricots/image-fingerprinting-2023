function [count] = HammingDistance(f1,f2)
% HAMMINGDISTANCE  compares two image fingerprints, 𝑓1 and 𝑓2, and
% determines the number of positions at which the corresponding values
% differ. The number of positions that differ is known as the Hamming
% distance. A small Hamming distance indicates similar images.
%
% Inputs:
% • A 1-by-𝑛 logical row vector for fingerprint 𝑓1.
% • A 1-by-𝑛 logical row vector for fingerprint 𝑓2.
% Output:
% • A integer representing the number of differing bits between
%   fingerprints 𝑓1 and 𝑓2
%
% Author: Aye Thu

% initialise the number of differing positions between fingerprints
count = 0; 

% loop through the first fingerprint and compare each index with that of
% that of the second fingerprint
for i = 1:length(f1)
    if f1(i) ~= f2(i)
        % if values aren't the same, add one to the count
        count = count + 1;
    end
end

end