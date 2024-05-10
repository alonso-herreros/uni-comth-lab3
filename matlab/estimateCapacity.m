function [Cmax,pXmax]=estimateCapacity(P);
%
% [C,pX]=estimateCapacity(P);
%
% Función that numerically computes the capacity of a channel given its
% channel matrix.
%
%--------------------------------------------------------------------------
% Communications Theory - Lab
%
%        Author: Marcelino Lázaro
%       Created: April 2016
%        Update: April 2019
%--------------------------------------------------------------------------

pXmax = [];
Cmax=0;

paso=0.1;

for k1=0:paso:1
    for k2=0:paso:1-k1
        for k3=0:paso:1-k1-k2
            pX=[k1, k2, k3, 1-k1-k2-k3];
            pY=pX*P;
            pXY=P.*repmat(transpose(pX),1,4);
            C=estimateMutualInformation(pX,pY,pXY);
            if C > Cmax
                Cmax=C;
                pXmax=pX;
            elseif C == Cmax
                pXmax=[pXmax;pX];
            end
        end
    end
end
