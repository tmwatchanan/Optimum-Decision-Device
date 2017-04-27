AccuracyList = [];
EnergyValue = 0.1:0.1:15;
for energy = 1:length(EnergyValue)
    count = 0;
    for i = 1:MESSAGE_COUNT
        m = Messages(i);
        E = EnergyValue(energy);
        s = Transmitter(m, E);
        [r, n] = Channel(independent, s, Variance);
        ratio = PROBABILITY_m0 / PROBABILITY_m1; % P0/P1
        if strcmp(DECISION_MODE, 'OPTIMUM')
            m_hat = OptimumDecisionRule(s, r, ratio, selector, Variance);
        elseif strcmp(DECISION_MODE, 'ARBITRARY')
            m_hat = ArbitraryDecision(r);
        else
            disp('[ERROR] Invalid DECISION_MODE');
            return;
        end
        if (m_hat == m)
            count = count + 1;
        end
    end
    accuracy = count / i;
    AccuracyList = [AccuracyList; accuracy];
%     disp(['[E=' num2str(E) '] Accuracy of Arbitary Decision = ' num2str(accuracy * 100) '%'])
end
Error = 1 - AccuracyList;

%%
figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
% errorInLog(errorInLog == -inf) = -10; % replaces -inf
% errorInLog = log(Error);
semilogy(EnergyValue, Error);
title(titleString);
xlabel(xlabelString); % x-axis label
ylabel(ylabelString); % y-axis label