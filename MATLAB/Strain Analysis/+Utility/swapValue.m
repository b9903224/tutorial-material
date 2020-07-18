function [imgH, imgW] = swapValue(imgH, imgW)


%%
tempValue = imgH;
imgH = imgW;
imgW = tempValue;

end