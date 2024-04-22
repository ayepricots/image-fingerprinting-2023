function [fingerprint] = ImageFingerprint(colour_image,hash,resize)
% IMAGEFINGERPRINT creates a 64-bit image fingerprint using the specified
% hashing and resizing algorithm for a given colour image
% 
% Inputs:
% • An 𝑚-by-𝑛-by-3 uint8 array representing a colour image.
% • A character vector containing either 'AvgHash' or 'DiffHash'.
% • A character vector containing either 'Nearest' or 'Box'.
% Output:
% • A 1-by-64 logical row vector representing the image fingerprint.
%
% Author: Aye Thu

% Use the GreyscaleLuma function to turn the image into a greyscale image.
greyscale_image = GreyscaleLuma(colour_image);

% Resize and hash the image. If AvgHash is prompted, resize the image to an
% 8-by-8 greyscale image. If DiffHash is prompted, resize to an 8-by-9.
if contains(resize, 'Nearest') % use the ResizeNearest function
    if contains(hash, 'AvgHash')
        resized = ResizeNearest(greyscale_image, [8 8]);
        fingerprint = AvgHash(resized);
    elseif contains(hash, 'DiffHash')
        resized = ResizeNearest(greyscale_image, [8 9]);
        fingerprint = DiffHash(resized);
    end

elseif contains(resize, 'Box') % use the ResizeBox function
    if contains(hash, 'AvgHash')
        resized = ResizeBox(greyscale_image, [8 8]);
        fingerprint = AvgHash(resized);
    elseif contains(hash, 'DiffHash')
        resized = ResizeBox(greyscale_image, [8 9]);
        fingerprint = DiffHash(resized);
    end
end

end