clc; 
clear all;

% Load an example image
originalImage = imread('input_image.jpeg'); % Replace 'input_image.jpeg' with your image path
originalImageInGray = rgb2gray(originalImage);
originalDimensions = size(originalImageInGray);

% Configuring resized image dimensions
modValue = 100;
sizeOfBrokenImage = modValue;
remainderOfMod = mod(min(originalDimensions), modValue);
newRowSize = min(originalDimensions) - remainderOfMod;
newColSize = newRowSize;
resizedDimensions = [newRowSize, newColSize];   
resizedImage = imresize(originalImageInGray, resizedDimensions, 'nearest'); % You can change the interpolation method here
sqrtOfNumberOfImagesToBeBrokenInto = newRowSize / sizeOfBrokenImage;
totalNumberOfPieces = sqrtOfNumberOfImagesToBeBrokenInto ^ 2;
newRowSizePerPiece = newRowSize / sqrtOfNumberOfImagesToBeBrokenInto;
newColSizePerPiece = newColSize / sqrtOfNumberOfImagesToBeBrokenInto;

jigsawHolderUnshuffled = zeros(newRowSizePerPiece, newColSizePerPiece, totalNumberOfPieces); % dimensions, sequentialIndex
jigsawHolderShuffled = zeros(newRowSizePerPiece, newColSizePerPiece, totalNumberOfPieces); % dimensions, scrambledIndex
jigsawHolderRecovered = zeros(newRowSizePerPiece, newColSizePerPiece, totalNumberOfPieces); % dimensions, scrambledIndex

% Sequential indices
sequentialIndex = 1:totalNumberOfPieces;

% Shuffle
shuffledIndex = randperm(totalNumberOfPieces);  % where the current sub-image is placed
shuffledLookUp = ones(1, totalNumberOfPieces);

% Shuffle image
[jigsawHolderUnshuffled, jigsawHolderShuffled, shuffledLookUp] = shuffleImages(resizedImage, newRowSizePerPiece, newColSizePerPiece, totalNumberOfPieces, sqrtOfNumberOfImagesToBeBrokenInto, sizeOfBrokenImage, shuffledIndex, shuffledLookUp);

% Display the shuffled images without spaces
figure('Name', 'Shuffled broken Images', 'NumberTitle', 'off');
for i = 1:totalNumberOfPieces
    subplot(sqrtOfNumberOfImagesToBeBrokenInto, sqrtOfNumberOfImagesToBeBrokenInto, i);
    imshow(jigsawHolderShuffled(:, :, i), 'Border', 'tight');
    title(num2str(shuffledLookUp(i)));
end

% Unshuffling
jigsawHolderRecovered = unshuffleImages(jigsawHolderShuffled, jigsawHolderRecovered, shuffledIndex, shuffledLookUp, totalNumberOfPieces, sqrtOfNumberOfImagesToBeBrokenInto);
