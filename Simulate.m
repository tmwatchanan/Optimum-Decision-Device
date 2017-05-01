AccuracyList = [];
EnergyValue = 0.1:0.1:15;
for energy = 1:length(EnergyValue)
    E = EnergyValue(energy);
    s = Transmitter(Messages, E);
%     [r, n] = Channel(independent, s, Variance, MESSAGE_COUNT); % r = received signal, n = noise
    r = Channel(s, noise);
%     ratio = PROBABILITY_m0 / PROBABILITY_m1; % P0/P1
    if strcmp(DECISION_MODE, 'OPTIMUM')
        OptimumDecisionRule;
    elseif strcmp(DECISION_MODE, 'ARBITRARY')
        m_hat = ArbitraryDecision(r);
    else
        disp('[ERROR] Invalid DECISION_MODE');
        return;
    end
    count = length(m_hat(m_hat ~= Messages));
    probError = count / MESSAGE_COUNT;
    ErrorList(energy) = probError;
    if (E == 0.1 || E == 7.5 || E == 15)
        r_0 = r(r >= 0);
        r_1 = r(r < 0);
%         figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
        figure;
        hold on
        histogram(r_0, 'Normalization', 'pdf');%, 'EdgeAlpha', 0.5);
        histogram(r_1, 'Normalization', 'pdf');%, 'EdgeAlpha', 0.5);
        lineTH = vline(threshold(find(EnergyValue == E)),'black', ['Threshold=' num2str(threshold(find(EnergyValue == E)))]);
        title(['Question (' QUESTION ') ' independentString ' | E = ' num2str(E)]);
        xlabel('r'); % x-axis label
        ylabel('pdf'); % y-axis label
        hold off
    end
end

%%
figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
semilogy(EnergyValue, ErrorList);
title(titleString);
xlabel(xlabelString); % x-axis label
ylabel(ylabelString); % y-axis label
% grid minor