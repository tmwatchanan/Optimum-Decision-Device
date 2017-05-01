if independent == 1 % Jointly statistically independent
    threshold(energy) = -(1/2) / sqrt(E) * log(PROBABILITY_m0 / PROBABILITY_m1);
    if selector == [1 1 1]
        ratio = sum(bsxfun(@rdivide, r, Variance'), 2);
    elseif selector == [1 0 0] % based only on r1
        ratio = sum(bsxfun(@rdivide, r(:, 1), Variance(1)), 2);
    else
        disp('Invalid selector');
    end
    m_hat = ratio < threshold(energy); % less than : m_hat = 1 % more than : m_hat = 1
elseif independent == 0 % NOT Jointly statistically independent
    
end