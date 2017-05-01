if independent == 1 % Jointly statistically independent
    noise = bsxfun(@times, randn(MESSAGE_COUNT, 3), sqrt(Variance(1:3))');
else % NOT jointly statistically independent
    Mean = [0, 0, 0];
    CovarianceMatrix = [Variance(1) Covariance(1) Covariance(2); Covariance(1) Variance(2) Covariance(3); Covariance(2) Covariance(3) Variance(3)];
    noise = mvnrnd(Mean, CovarianceMatrix, MESSAGE_COUNT);
end