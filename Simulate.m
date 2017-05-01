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
        ArbitraryDecision;
    else
        disp('[ERROR] Invalid DECISION_MODE');
        return;
    end
    count = length(m_hat(m_hat ~= Messages));
    probError = count / MESSAGE_COUNT;
    ErrorList(energy) = probError;
    if (QUESTION ~= 'b') && (E == 0.1 || E == 7.5 || E == 15)
        figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
        hold on
        for subplotNumber = 1:3
            rPlot = r(:, subplotNumber);
            r_0 = rPlot(m_hat == 0);
            r_1 = rPlot(m_hat == 1);
            graphSubplot = subplot(3, 1, subplotNumber);
            hold on
            histogram(graphSubplot, r_0, 'Normalization', 'pdf', 'EdgeAlpha', 0.5);
            histogram(graphSubplot, r_1, 'Normalization', 'pdf', 'EdgeAlpha', 0.5);
            lineTH = vline(threshold(find(EnergyValue == E)),'green', ['Threshold=' num2str(threshold(find(EnergyValue == E)))]);
            title(['Question (' QUESTION ') ' independentString ' | E = ' num2str(E) '| Variance = ' num2str(Variance(subplotNumber))]);
            xlabel('r'); % x-axis label
            ylabel('pdf'); % y-axis label
        end
        hold off
        if independent == 1 % Jointly statistically independent
            if strcmp(DECISION_MODE, 'ARBITARY')
                SaveName = ['h-f-' num2str(QUESTION) '_E=' num2str(E)];
            else
                SaveName = [num2str(QUESTION) '_E=' num2str(E)];
            end
        else % NOT jointly statistically independent
            if strcmp(DECISION_MODE, 'ARBITARY')
                SaveName = ['h-f-' num2str(QUESTION) '_E=' num2str(E)];
            else
                SaveName = ['h-' num2str(QUESTION) '_E=' num2str(E)];
            end
        end
        SaveFigure;
    end
end

if QUESTION == 'b'
    if isequal(selector, [1 0 0])
        B_error{1} = ErrorList;
        selector = [1 1 1];
        Simulate;
    elseif isequal(selector, [1 1 1])
        B_error{2} = ErrorList;
        PlotErrorGraph;
    end
else
    PlotErrorGraph;
end

