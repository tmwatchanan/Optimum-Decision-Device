if selector == [1 1 1]
    ratio(energy) = -(1/2) / sqrt(E) * log(PROBABILITY_m0 / PROBABILITY_m1);
    threshold = sum(bsxfun(@rdivide, r, Variance'), 2);
    m_hat = threshold < ratio(energy); % less than : m_hat = 1 % more than : m_hat = 1
elseif selector == [1 0 0] % based only on r1
    threshold = 2 * abs(s) * sum(r(1) ./ Variance(1));
    if (threshold >= ratio)
        m_hat = 0;
    else
        m_hat = 1;
    end
else
    disp('Invalid selector');
end