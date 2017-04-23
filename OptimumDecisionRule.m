function [ m_hat ] = OptimumDecisionRule(s, r, ratio, selector)
%         threshold = (1 / s) * ((s^2) / 2 + log(ratio));
        threshold = log(ratio) / (2 * s);
        
        % message = m0 (signal = -) (condition == 0) is < threshold
        % message = m1 (signal = +) (condition == 1) is > threshold
        condition = (r >= threshold);
        if selector == [1 0 0] % based only on r1
            if condition(1) == 1
                m_hat = 0;
            else
                m_hat = 1;
            end
        elseif selector == [1 1 1]
            if (sum(condition) >= 2)
                m_hat = 0;
            else
                m_hat = 1;
            end 
        else
            disp('Invalid selector');
        end
end

