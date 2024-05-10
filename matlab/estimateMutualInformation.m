function [I] = estimateMutualInformation(prX, prY, prXY)
    [HXcY, ~] = estimateConditionalEntropy(prX, prY, prXY);
    I = estimateEntropy(prX) - HXcY;
end