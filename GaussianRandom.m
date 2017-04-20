function [ randomNumber ] = GaussianRandom( SD )
    mean = 0; % zero-mean
    randomNumber = SD.*randn(1,1) + mean;
end