PROBABILITY_m0 = 0.5; % P0
PROBABILITY_m1 = 1 - PROBABILITY_m0; % P1
RATIO = PROBABILITY_m0 / PROBABILITY_m1; % P0/P1
Variance = [1; 1; 1];

AccuracyList = [];
EnergyValue = 0.1:0.1:15;
for energy = 1:length(EnergyValue)
    count = 0;
    for message = 1:50000%0000
        m = randi([0 1]); % 0 or 1
        randomNumber = randi([1 length(EnergyValue)], 1, 1);
        E = EnergyValue(energy);
        s = Signal(m, E);
        noise = [GaussianRandom(sqrt(Variance(1))); GaussianRandom(sqrt(Variance(1))); GaussianRandom(sqrt(Variance(1)))];
        r = s + noise;
        
%         threshold = (1 / s) * ((s^2) / 2 + log(RATIO));
        threshold = log(RATIO) / (2 * s);
        
        % message = m0 (signal = -) is < threshold
        % message = m1 (signal = +) is > threshold
        condition = (r >= threshold);
        if (sum(condition) >= 2)
            m_hat = 0;
        else
            m_hat = 1;
        end
        
        if (m_hat == m)
            count = count + 1;
        end
    end
    accuracy = (count) / message;
    AccuracyList = [AccuracyList; accuracy];
%     disp(['[E=' num2str(E) '] Accuracy of Arbitary Decision = ' num2str(accuracy * 100) '%'])
end
Error = 1 - AccuracyList;
figure;
title('Graph');
plot(EnergyValue, log(Error));
xlabel('signal energy', 'E=0.1 to 15 (0.1 increment)') % x-axis label
ylabel('error', 'log scale') % y-axis label


%         m_hat = [];
%         for i = 1:3
%             m_hat(i) = ArbitaryDecision(r(i));
%             if (m == m_hat(i))
% %                 disp(['[i=' num2str(i) '] matched']);
%                 count = count + 1;
%             else
% %                 disp(['[i=' num2str(i) '] not-matched']);
%             end
%         end