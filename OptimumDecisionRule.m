function [ m_hat ] = OptimumDecisionRule(s, r, ratio, selector, Variance)
%         threshold = (1 / s) * ((s^2) / 2 + log(ratio));
        
        % message = m0 (signal = -) (condition == 0) is < threshold
        % message = m1 (signal = +) (condition == 1) is > threshold
        if selector == [1 1 1]
            threshold = 2 * abs(s) * sum(r ./ Variance);
            if (threshold >= log(ratio))
                m_hat = 0;
            else
                m_hat = 1;
            end 
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
end
