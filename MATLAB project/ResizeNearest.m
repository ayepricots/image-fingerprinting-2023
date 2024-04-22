function [imageResized] = ResizeNearest(imageOriginal,dimensions)
% RESIZENEAREST uses the Nearest Neighbour Interpolation algorithm to
% resize an image to the specified dimensions
%
% Inputs:
% • An 𝑚-by-𝑛-by-𝑝 uint8 array representing a greyscale (𝑝 = 1) or a RGB
%   colour (𝑝 = 3) image.
% • A 1-by-2 double array containing two values (𝑖, 𝑗) representing the
%   desired height 𝑖 (i.e., 𝑖 rows) and width 𝑗 (i.e., 𝑗 columns) to resize
%   the image to.
% Output:
% • An 𝑖-by-𝑗-by-𝑝 uint8 array representing the resized greyscale (𝑝 = 1)
%   or RGB colour (𝑝 = 3) image.
%
% Author: Aye Thu

% retrieve the number of rows (m), columns (n) and layers (p) in the
% original image array
[m,n,p] = size(imageOriginal);

% retrieve the number of rows and columns of the resized image
% array
rows = dimensions(1);
cols = dimensions(2);

% preallocate the output arry
imageResized = zeros(rows, cols, p, "uint8");

rrow = m/rows; % row size ratio 
rcol = n/cols; % column size ratio

% loop through the resized image array and assign the new pixel values
for k = 1:p
    for i = 1:rows
        for j = 1:cols
            % find the relative position of the resized pixel in the
            % original image and round values up to nearest integer
            relativeI = ceil((i - 0.5)*rrow);
            relativeJ = ceil((j - 0.5)*rcol);
            
            % assign the relative positions to the resized image
            imageResized(i,j,k) = imageOriginal(relativeI,relativeJ,k);
        end
    end
end

end