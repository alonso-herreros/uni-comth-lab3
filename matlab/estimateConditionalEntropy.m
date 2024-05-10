function [HXcY, HYcX] = estimateConditionalEntropy(prX, prY, prXY)
    HXcY = sum(prXY .* log2(prY ./ prXY), "all", "omitnan");
    HYcX = sum(prXY .* log2(prX' ./ prXY), "all", "omitnan");
end