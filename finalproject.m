% Photo Puzzle Shuffling and Unshuffling

% Read the input image
inputImage = imread('input_image.jpeg'); 
imshow(inputImage);
title('Original Image');

% Convert the image to grayscale
grayImage = rgb2gray(inputImage);

% Get the dimensions of the image
[rows, cols] = size(grayImage);


N = 9; % Number of pieces
pieceSize = sqrt(N);

% Calculate the size of each piece
pieceRows = rows / pieceSize;
pieceCols = cols / pieceSize;

% Initialize the shuffled image
shuffledImage = zeros(rows, cols, 'uint8');

% Shuffling the image into 9 pieces in a 3x3 grid
k = 1;
for i = 1:pieceSize
    for j = 1:pieceSize
        piece = grayImage((i-1)*pieceRows+1:i*pieceRows, (j-1)*pieceCols+1:j*pieceCols);
        shuffledImage((k-1)*pieceRows+1:k*pieceRows, (k-1)*pieceCols+1:k*pieceCols) = piece;
        k = k + 1;
    end
end


% Display the shuffled image
figure;
imshow(shuffledImage);
title('Shuffled Image');

% Unshuffling the image 
unshuffledImage = zeros(rows, cols, 'uint8');

k = 1;
for i = 1:pieceSize
    for j = 1:pieceSize
        piece = shuffledImage((k-1)*pieceRows+1:k*pieceRows, (k-1)*pieceCols+1:k*pieceCols);
        unshuffledImage((i-1)*pieceRows+1:i*pieceRows, (j-1)*pieceCols+1:j*pieceCols) = piece;
        k = k + 1;
    end
end

% Display the unshuffled image
figure;
imshow(unshuffledImage);
title('Unshuffled Image');




