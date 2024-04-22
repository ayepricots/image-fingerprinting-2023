function [diff_hash] = DiffHash(greyscale_image)
% DIFFHASH converts an 𝑚-by-(𝑛 + 1) greyscale image into a hash containing
% 𝑚𝑛 bits using the Differential Hashing algorithm.
%
% Input: An 𝑚-by-(𝑛 + 1) uint8 array representing a greyscale image.
% Output: A 1-by-𝑚𝑛 logical row vector representing the differential hash
%         of the greyscale image. Logical 1 represents the pixel value
%         being greater than or equal to that on the right. Logical 0
%         represents the pixel value being less.
%
% Author: Aye Thu

% retrieve the number of rows (m), columns (n) of the greyscale image array
[m, n] = size(greyscale_image);

% preallocate the logical row vector
diff_hash = (zeros(1, m*(n-1), "logical"));

% initialise the index (k) for the logical row vector
k = 1;

% loop through the greyscale image array and compare each pixel value to
% the pixel value on the right
for i = 1:m
    % only iterate to the second the last column as we can't compare the
    % end of row pixel to that on the right
    for j = 1:n-1
        if greyscale_image(i,j) >= greyscale_image(i,j+1)
            true_false = 1;
        else
            true_false = 0;
        end
        % assign whether the pixel value comparison is logical 1 or 0
        % into a logical row vector
        diff_hash(k) = true_false;

        k = k + 1; 
    end
end

end