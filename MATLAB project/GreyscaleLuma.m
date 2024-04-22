function [greyscale_image] = GreyscaleLuma(colour_image)
% GREYSCALELUMA converts the supplied RGB colour image to a greyscale
% version by calculating a weighted sum for each pixel.
%
% Input: An 𝑚-by-𝑛-by-3 uint8 array representing an RGB colour image.
% Output: An 𝑚-by-𝑛-by-1 uint8 array representing a greyscale image.
%
% Author: Aye Thu

% retrieve the number of rows (m), columns (n) of the colour image array
sizes = size(colour_image);
m = sizes(1);
n = sizes(2);

% preallocating the output array as an 𝑚-by-𝑛-by-1 uint8 array
greyscale_image = zeros(m, n, "uint8");

% looping through the colour image array to replace each rgb pixel with
% its greyscale counterpart
for i = 1:m
    for j = 1:n
        % weighted sum formula for rgb to greyscale
        greyscale = 0.2126*double(colour_image(i,j,1)) + ...
                    0.7152*double(colour_image(i,j,2)) + ...
                    0.0722*double(colour_image(i,j,3));
        greyscale_image(i,j) = greyscale; % applying the forumla
    end
end

end