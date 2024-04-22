function [imageResized] = ResizeBox(imageOriginal,dimensions)
% RESIZEBOX uses the Box Sampling algorithm to resize an image to the
% specified dimensions.
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

% retrieve the number of rows and columns of the resized image array
rows = dimensions(1);
cols = dimensions(2);

% preallocate the output array
imageResized = zeros(rows, cols, p, "uint8");

% retrieve values for the height & width of each box of the original image
boxHeight = m/rows;
boxWidth = n/cols;

% loop through the resized image array and assign the new pixel values
for i = 1:rows
    for j = 1:cols
        for k = 1:p
            % find the row and column boundaries of the box that is to be
            % accessed from the original image
            iBound1 = 1 + (i - 1)*boxHeight;
            iBound2 = round(iBound1 + boxHeight) - 1;
            if mod(iBound1,floor(iBound1)) == 0.5
                % include the pixel if half of the height is within the box
                iBound1 = floor(iBound1);
            end

            jBound1 = 1 + (j - 1)*boxWidth;
            jBound2 = round(jBound1 + boxWidth) - 1;
            if mod(jBound1,floor(jBound1)) == 0.5
                % include the pixel if half of the width is within the box
                jBound1 = floor(jBound1);
            end

            % access the box in the original image
            box = imageOriginal(round(iBound1):iBound2, ... 
                  round(jBound1):jBound2, k);

            % find the average pixel value within the box rounded to the
            % nearest integer
            boxAverage = round(mean(box, 'all'));

            % assign the box average to the resized image
            imageResized(i,j,k) = boxAverage;
        end
    end
end

end