% Read the input image
inputImage = imread('input_image.jpeg');
figure;
imshow(inputImage);
title('Original Image');

% Convert the image to grayscale
grayImage = rgb2gray(inputImage);

% Get the dimensions of the image
[rows, cols] = size(grayImage);

% Setup for 2x2 pieces
N = 4; % Number of pieces
pieceSize = sqrt(N);

% Calculate the size of each piece
pieceRows = rows / pieceSize;
pieceCols = cols / pieceSize;

% Initialize the shuffled image
shuffledImage = zeros(rows, cols, 'uint8');

% Generate a random permutation of 4 elements
perm = randperm(N);

% Shuffling the image into 4 pieces in a 2x2 grid
figure;
for i = 1:pieceSize
    for j = 1:pieceSize
        row = floor((perm((i-1)*pieceSize+j)-1) / pieceSize) + 1;
        col = mod((perm((i-1)*pieceSize+j)-1), pieceSize) + 1;
        piece = grayImage((row-1)*pieceRows+1:row*pieceRows, (col-1)*pieceCols+1:col*pieceCols);
        shuffledImage((i-1)*pieceRows+1:i*pieceRows, (j-1)*pieceCols+1:j*pieceCols) = piece;
        subplot(pieceSize, pieceSize, (i-1)*pieceSize+j);
        imshow(shuffledImage);
        title(['Shuffled Image: Step ', num2str((i-1)*pieceSize+j)]);
    end
end

% Unshuffling the image
unshuffledImage = zeros(rows, cols, 'uint8');

figure;
for i = 1:pieceSize
    for j = 1:pieceSize
        row = floor((perm((i-1)*pieceSize+j)-1) / pieceSize) + 1;
        col = mod((perm((i-1)*pieceSize+j)-1), pieceSize) + 1;
        piece = shuffledImage((i-1)*pieceRows+1:i*pieceRows, (j-1)*pieceCols+1:j*pieceCols);
        unshuffledImage((row-1)*pieceRows+1:row*pieceRows, (col-1)*pieceCols+1:col*pieceCols) = piece;
        subplot(pieceSize, pieceSize, (i-1)*pieceSize+j);
        imshow(unshuffledImage);
        title(['Unshuffled Image: Step ', num2str((i-1)*pieceSize+j)]);
    end
end