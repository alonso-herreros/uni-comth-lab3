function [HX] = estimateEntropy(prX)
    HX = -sum(prX.*log2(prX), "omitnan");
end