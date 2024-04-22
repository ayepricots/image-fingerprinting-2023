function [average_hash] = AvgHash(greyscale_image)
% AVGHASH uses the Average Hashing algorithm to convert an 𝑚-by-𝑛
% greyscale image into a hash containing 𝑚𝑛 bits 
%
% Input: An 𝑚-by-𝑛 uint8 array representing a greyscale image.
% Output: A 1-by-𝑚𝑛 logical row vector representing the average hash of
%         the greyscale image. Logical 1 represents the pixel value being
%         greater than or equal to the average value. Logical 0 represents
%         the pixel value being less than the average.
%
% Author: Aye Thu

% initialise the logical row vector
average_hash = [];

% find the average pixel value rounded to the nearest integer
average = round(mean(greyscale_image, 'all'));

% retrieve the number of rows (m), columns (n) of the greyscale image array
[m, n] = size(greyscale_image);

% loop through the greyscale image array and compare each pixel value to
% the average pixel value.
for i = 1:m
    for j = 1:n
        if greyscale_image(i,j) >= average
            true_false = 1;
        else
            true_false = 0;
        end
        % concatenate whether the pixel value comparison is logical 1 or 0
        % into a logical row vector
        average_hash = logical([average_hash, true_false]);
    end
end

end