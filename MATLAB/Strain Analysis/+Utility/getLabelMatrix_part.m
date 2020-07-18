function [labelMatrix_part, pixelCountTotal] = getLabelMatrix_part(imgH, imgW, labelMatrix, PixelIdx)

uniqueLabelAry = unique(labelMatrix(PixelIdx));
uniqueLabelAry = uniqueLabelAry(~ismember(uniqueLabelAry, 0));

%%
pixelCountTotal = 0;
labelMatrix_part = false(imgH, imgW);
for index = 1 : numel(uniqueLabelAry)
    uniqueLabel = uniqueLabelAry(index);
    labelMatrix_part0 = labelMatrix == uniqueLabel;
    labelMatrix_part(labelMatrix_part0) = true;
    pixelCount = sum(sum(labelMatrix_part0));
    pixelCountTotal = pixelCountTotal + pixelCount;
end

end