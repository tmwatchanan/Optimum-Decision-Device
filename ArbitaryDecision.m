function [ m_hat ] = ArbitaryDecision( rArray )
    m_hat = sum(rArray);
    if (m_hat >= 0) m_hat = 0;
    else m_hat = 1;
end

