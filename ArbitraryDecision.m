function [ m_hat ] = ArbitaryDecision( rArray )
    m_hat = sum(rArray);
    if (m_hat >= 0) % r1 + r2 + r3 >= 0
        m_hat = 0;
    else % r1 + r2 + r3 < 0
        m_hat = 1;
    end
end