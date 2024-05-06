% Read in the input image
input_image = imread('input_image.jpeg');

% Get the dimensions of the input image
[height, width, ~] = size(input_image);

% Determine the size of each piece
piece_height = floor(height / 2);
piece_width = floor(width / 2);

% Initialize the shuffled image
shuffled_image = uint8(zeros(height, width, 3));

% Cut the input image into 4 pieces and shuffle them
pieces = cell(1, 4);
idx = 1;
for i = 1:2
    for j = 1:2
        pieces{idx} = input_image((i-1)*piece_height+1:i*piece_height, (j-1)*piece_width+1:j*piece_width, :);
        idx = idx + 1;
    end
end
shuffled_pieces = pieces(randperm(4));

% Place the shuffled pieces into a 2x2 grid
idx = 1;
for i = 1:2
    for j = 1:2
        shuffled_image((i-1)*piece_height+1:i*piece_height, (j-1)*piece_width+1:j*piece_width, :) = shuffled_pieces{idx};
        idx = idx + 1;
    end
end

% Display the original, shuffled, and unshuffled images
figure;

subplot(1, 3, 1);
imshow(input_image);
title('Original Image');

subplot(1, 3, 2);
imshow(shuffled_image);
title('Shuffled Image');

% Algorithm to unshuffle the image without knowing the locations
original_image = input_image;
unshuffled_image = shuffled_image;
iteration = 0;
while ~isequal(unshuffled_image, original_image)
    % Randomly permute the indices of the pieces
    shuffled_indices = randperm(4);

    % Place the shuffled pieces into a 2x2 grid using the shuffled indices
    idx = 1;
    for i = 1:2
        for j = 1:2
            unshuffled_image((i-1)*piece_height+1:i*piece_height, (j-1)*piece_width+1:j*piece_width, :) = shuffled_pieces{shuffled_indices(idx)};
            idx = idx + 1;
        end
    end

    % Display the unshuffled image
    subplot(1, 3, 3);
    imshow(unshuffled_image);
    title('Unshuffled Image');

 

    % Pause for a moment to visualize the unshuffling process
    pause(1);
    
    % Increment iteration count
    iteration = iteration + 1;
    
    % Break out of the loop 
    if isequal(unshuffled_image, original_image)
        disp('Unshuffling process completed.');
        break;
    elseif iteration > 30
        disp('Max iter');
        break;
    end
end
