function jigsawHolderRecovered = unshuffleImages(jigsawHolderShuffled, jigsawHolderRecovered, shuffledIndex, shuffledLookUp, totalNumberOfPieces, sqrtOfNumberOfImagesToBeBrokenInto)
%UNSHUFFLEIMAGES 
numberOfPlotsPerRow = sqrtOfNumberOfImagesToBeBrokenInto;
numberOfPlotsPerColumn = sqrtOfNumberOfImagesToBeBrokenInto;
plotIndex = 1;
figureIndex = 1;
figureTitle = ['UnShuffled broken Images : ' ...
            num2str(totalNumberOfPieces)];
figure('Name', figureTitle,'NumberTitle','off'),
for i = 1:sqrtOfNumberOfImagesToBeBrokenInto
    for j = 1:sqrtOfNumberOfImagesToBeBrokenInto   
        sequentialIndex = (i-1)*sqrtOfNumberOfImagesToBeBrokenInto + j;
        selectedPiece = jigsawHolderShuffled(:,:,shuffledIndex(sequentialIndex));
        jigsawHolderRecovered(:,:,sequentialIndex) = selectedPiece;
              
        subplot(numberOfPlotsPerRow, numberOfPlotsPerColumn, plotIndex),
        imshow(selectedPiece, []);       
        title(num2str(sequentialIndex));
        plotIndex = plotIndex + 1;
    end
end
end
