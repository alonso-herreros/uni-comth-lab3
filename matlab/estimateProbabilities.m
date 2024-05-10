function [aX,aY,prX,prY,prXY]=estimateProbabilities(X,Y);
%
% [aX,aY,prX,prY,prXY]=estimateProbabilities(X,Y);
%
% Function that estimates probabilities of interest related
% to two radom variables from realizations thereof. It returns
%
%   aX : alphabet of X (1 x Mx)
%   aY : alphabet of Y (1 x My)
%   prX : marginal distribution of X (1 x Mx)
%   prY : marginal distribution of Y (1 x My)
%  prXY : joint distribution of X and Y (Mx x My)
%
%--------------------------------------------------------------------------
% Communications Theory - Lab
%
%        Author: Marcelino Lázaro
%       Created: April 2016
%        Update: April 2019
%--------------------------------------------------------------------------

Nx=length(X);
aX=unique(X);
prX=zeros(1,length(aX));
for kx=1:length(aX)
    vx=find(X==aX(kx));
    prX(kx)=length(vx)/Nx;
end

Ny=length(Y);
aY=unique(Y);
prY=zeros(1,length(aY));
for ky=1:length(aY)
    vy=find(Y==aY(ky));
    prY(ky)=length(vy)/Ny;
end

prXY=zeros(length(aX),length(aY));

for kx=1:length(aX)
    for ky=1:length(aY)
        v=find(X==aX(kx) & (Y==aY(ky)) );
        prXY(kx,ky)=length(v)/Nx;
    end
end
