if isequal(selector, [1 1 1])
    summation = sum(r, 2);
    m_hat = summation < 0;
    % r1 + r2 + r3 < 0 --> m_hat = 1
    % r1 + r2 + r3 >= 0 --> m_hat = 0
elseif isequal(selector, [1 0 0]) % based only on r1
    m_hat = r(:, 1) < 0;
    % r1 < 0 --> m_hat = 1
    % r1 >= 0 --> m_hat = 0
else
    disp('Invalid selector');
end