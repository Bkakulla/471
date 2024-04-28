function presentShuffledImages(jigsawHolderShuffled, sqrtOfNumberOfImagesToBeBrokenInto, totalNumberOfPieces, shuffledLookUp)
    numberOfPlotsPerRow = sqrtOfNumberOfImagesToBeBrokenInto;
    numberOfPlotsPerColumn = sqrtOfNumberOfImagesToBeBrokenInto;
    % Display the shuffled pieces
    plotIndex = 1;
    figureTitle = ['Shuffled broken Images : ' ...
                num2str(totalNumberOfPieces)];
    figure('Name', figureTitle,'NumberTitle','off');
    for i = 1:sqrtOfNumberOfImagesToBeBrokenInto
        for j = 1:sqrtOfNumberOfImagesToBeBrokenInto   
            sequentialIndex = (i-1)*sqrtOfNumberOfImagesToBeBrokenInto + j;
            selectedPiece = jigsawHolderShuffled(:,:,sequentialIndex);

            subplot(numberOfPlotsPerRow, numberOfPlotsPerColumn, plotIndex);
            imshow(selectedPiece, 'Border', 'tight');
            title(num2str(shuffledLookUp(sequentialIndex)));

            plotIndex = plotIndex + 1;
        end
    end
end
