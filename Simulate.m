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
    if (E == 0.1 || E == 15)
        figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
        r_0 = r(find(r >= 0));
        histogram(r_0, 'FaceColor', 'blue', 'EdgeColor', 'blue', 'EdgeAlpha',0.5);
        hold on
        r_1 = r(find(r < 0));
        histogram(r_1, 'FaceColor', 'magenta',  'EdgeColor', 'magenta', 'EdgeAlpha',0.5);
        hold on
        h = vline(ratio(find(EnergyValue == E)),'g','Threshold');
        title(titleString);
        xlabel(xlabelString); % x-axis label
        ylabel(ylabelString); % y-axis label
    end
end

%%
figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
semilogy(EnergyValue, ErrorList);
title(titleString);
xlabel(xlabelString); % x-axis label
ylabel(ylabelString); % y-axis label
% grid minor