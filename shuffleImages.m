function [jigsawHolderUnshuffled, jigsawHolderShuffled, shuffledLookUp] = shuffleImages(resizedImage, newRowSizePerPiece, newColSizePerPiece, totalNumberOfPieces, sqrtOfNumberOfImagesToBeBrokenInto, sizeOfBrokenImage, shuffledIndex, shuffledLookUp )
%SHUFFLEIMAGES 
numberOfPlotsPerRow = sqrtOfNumberOfImagesToBeBrokenInto;
numberOfPlotsPerColumn = sqrtOfNumberOfImagesToBeBrokenInto;
plotIndex = 1;
figureIndex = 1;
figureTitle = ['Shuffled broken Images : ' ...
            num2str(totalNumberOfPieces)];
figure('Name', figureTitle,'NumberTitle','off'),
for i = 1:sqrtOfNumberOfImagesToBeBrokenInto
    for j = 1:sqrtOfNumberOfImagesToBeBrokenInto       
        selectedPiece = resizedImage((i-1)*sizeOfBrokenImage + 1:i*sizeOfBrokenImage, ...
            (j-1)*sizeOfBrokenImage + 1:j*sizeOfBrokenImage);
        subplot(numberOfPlotsPerRow, numberOfPlotsPerColumn, plotIndex),
        imshow(selectedPiece);
        sequentialIndex = (i-1)*sqrtOfNumberOfImagesToBeBrokenInto + j;
        title(num2str(sequentialIndex));
        plotIndex = plotIndex + 1;
       
        jigsawHolderUnshuffled(:,:,sequentialIndex) = selectedPiece;
        jigsawHolderShuffled(:,:,shuffledIndex(sequentialIndex)) = selectedPiece; 
       
        shuffledLookUp(shuffledIndex(sequentialIndex)) = sequentialIndex;
    end
end
end

