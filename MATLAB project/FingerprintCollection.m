function [fp_collection] = FingerprintCollection(filenames,hash,resize)
% FINGERPRINTCOLLECTION stores all of the image fingerprints from a list of
% image filenames so they can be quickly looked up for comparison.
%
% Inputs:
% • An 𝑚-by-1 string array representing a list of image file names.
% • A character vector containing either 'AvgHash' or 'DiffHash'.
% • A character vector containing either 'Nearest' or 'Box'.
% Output:
% • An 𝑚-by-1 cell array containing the fingerprint from each image file.
%
% Author: Aye Thu

m = length(filenames); % number of rows of the fingerprint cell array (m)
fp_collection = cell(m,1); % preallocate the fingerprint cell array

% loop through the filenames and plug each image into the ImageFingerprint
% function and store their fingerprints into the fingerprint cell array
for i = 1:m
    colour_image = imread(filenames(i));
    fingerprint = ImageFingerprint(colour_image,hash,resize);
    fp_collection{i} = fingerprint;
end

end