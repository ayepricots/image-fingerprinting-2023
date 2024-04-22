function RankSimilarity(fingerprint,filenames,fp_collection,n)
% RANKSIMILARITY displays 𝑛 image files ranked by descending similarity 
% (i.e., the image most similar to the search image will be at the top of
% the list).
% 
% Inputs:
% • A 1-by-64 logical row vector representing the image fingerprint to
%   search.
% • An 𝑚-by-1 string array representing a list of image file names.
% • An 𝑚-by-1 cell array containing a collection of image fingerprints.
% • An integer 𝑛 denoting how many image fingerprint matches to display.
% Output:
% • None
%
% Author: Aye Thu

% initialise row vector for Hamming distances 
ham = zeros(1,length(filenames));

% loop through the Hamming distance vector and assign all the distances
for i = 1:length(ham)
    distance = HammingDistance(fingerprint,fp_collection{i});
    ham(i) = distance;
end

% sort the Hamming distance vector in ascending order (lowest distance to 
% highest) and sort the filenames array correspondingly
[ham, order] = sort(ham);
filenames = filenames(order);

% loop through the ranks (r) and display the top n similar images.
% for alignment, display 2 spaces before the Hamming distance if ham is a
% single digit, otherwise display 1 space
for r = 1:n
    % for alignment, display no extra space before the rank if n is a
    % single digit
    if n < 10
        if ham(r) < 10
            fprintf('%i. %2i - %s\n', r, ham(r), filenames(r));
        else
            fprintf('%i. %1i - %s\n', r, ham(r), filenames(r));
        end

    % for alignment, display 1 extra space before the rank if n is double
    % digits   
    elseif n > 9 && n < 100
        if ham(r) < 10
            fprintf('%2i. %2i - %s\n', r, ham(r), filenames(r));
        else
            fprintf('%2i. %1i - %s\n', r, ham(r), filenames(r));
        end
    end
end

end