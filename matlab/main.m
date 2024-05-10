% Lab3 
% Alonso Herreros & José Alberto Pastor
% As we were given a set of data, we have to how many diferent elements we
% have and compute its probability looking the the total number of elements
% that we have.

load('XYvariablesData.mat');

[aX,aY,prX,prY,prXY]=estimateProbabilities(X,Y);

%% 1. Find the alphabet and estimate the probability distribution of X, and
%  afterwards plot the latter, pX (xi)

% The alphabet is returned by the function
disp("Alphabet of X:");
disp(aX);

figure(1);
plot(prX);
title("Probability distribution of X. Average: " + mean(prX));

%% 2. Estimate the entropy of random variable X from realizations thereof

% For doing th entroy of X i need to aply the formula, luckily I know the
% porbability of each of the elements of the alphabet
[HX]=estimateEntropy(prX);

disp("Entropy of X: " + HX);

%% 3. Compare this value against the maximum possible for a random variable with the
%  same alphabet

% When the symbols are equally likely => we have the maximun entropy:
% max(H(X)) = log2(Mx) = log2(10)

disp("Maximum entropy: " + log2(length(aX)));

%% 4. Find the alphabet and estimate the probability distribution of Y, and
% afterwards plot the latter, pY (xj )

disp("Alphabet of Y:");
disp(aY);

figure(2);
plot(prY);
title("Probability distribution of Y. Average: " + mean(prY));

%% 5. Estimate the entropy of random variable Y from realizations thereof

% For doing th entroy of Y i need to aply the formula, luckily I know the
% porbability of each of the elements of the alphabet
[HY]=estimateEntropy(prY);

disp("Entropy of Y: " + HY);

%% 3. Compare this value against the maximum possible for a random variable with the
%  same alphabet

% When the symbols are equally likely => we have the maximun entropy:
% max(H(Y)) = log2(My) = log2(10)

disp("Maximum entropy: " + log2(length(aY)));

%% MARK: 1.2 Estimation of joint and conditional entropies

disp(" ")
disp("=== Section 1.2 ===")
disp(" ")

%% Estimate the joint entropy of random variables X and Y from realizations thereof.

HXY = estimateJointEntropy(prXY);

disp("Joint entropy of X and Y: " + HXY);

%% 2. Find the alphabet and the conditional distribution of X when Y = 1, pX|Y (xi|1),
% and plot it

% We find the alphabet by doing logic indexing of the elements of X when Y=1
disp("Alphabet of X given Y=1:");
disp(unique(X(Y==1)))

figure(3);
plot(prXY(:,1) / prY(1))
title("Probability distribution of X given Y=1. Average: " + mean(prXY(:,1)/prY(1)));

%% 3. Estimate the conditional entropy of X given Y

% We built a function for this

[HXcY, HYcX] = estimateConditionalEntropy(prX, prY, prXY);

disp("Conditional entropy of X given Y: " + HXcY);

%% 4. Estimate the conditional entropy of Y given X

disp("Conditional entropy of Y given X: " + HYcX);

%% MARK: 1.3 Estimation of joint and conditional entropies

disp(" ")
disp("=== Section 1.3 ===")
disp(" ")

%% 1. Find the mutual information between X and Y

% We built a function for this
IXY = estimateMutualInformation(prX, prY, prXY);

disp("Mutual information between X and Y: " + IXY);

%% 2. Find the mutual information between X and X
%  3. Estime la información mutua entre X y X

IXX = estimateMutualInformation(prX, prX, prX.*prX');

disp("Mutual information between X and X: " + IXX);

%% 4. Find the mutual information between Y and Y

IYY = estimateMutualInformation(prY, prY, prY.*prY');

disp("Mutual information between Y and Y: " + IYY);

%% 5. Explain the connection between these two values and the entropies obtained in the previous
%  sections

disp(":)");
