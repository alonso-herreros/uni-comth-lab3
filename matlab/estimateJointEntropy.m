function [HXY] = estimateJointEntropy(prXY)
    HXY = -sum(prXY .* log2(prXY), "all", "omitnan");
end