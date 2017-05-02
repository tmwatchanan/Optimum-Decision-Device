AccuracyList = [];
EnergyValue = 0.1:0.1:15;
for energy = 1:length(EnergyValue)
    E = EnergyValue(energy);
    s = Transmitter(Messages, E);
    r = Channel(s, noise);
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
    if (QUESTION ~= 'b' && QUESTION ~= 'g') && (E == 0.1 || E == 3.7 || E == 7.5 || E == 11.2 || E == 15)
        figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
        hold on
        for subplotNumber = 1:3
            rPlot = r(:, subplotNumber);
            r_0 = rPlot(m_hat == 0);
            r_1 = rPlot(m_hat == 1);
            graphSubplot = subplot(3, 1, subplotNumber);
            histogram(graphSubplot, r_0, 'Normalization', 'pdf', 'EdgeAlpha', 0.5);
            hold on
            histogram(graphSubplot, r_1, 'Normalization', 'pdf', 'EdgeAlpha', 0.5);
            if strcmp(DECISION_MODE, 'OPTIMUM')
                lineTH = vline(threshold(find(EnergyValue == E)),'green', ['Threshold=' num2str(threshold(find(EnergyValue == E)))]);
            end
            title(['Question (' QUESTION ') ' independentString ' | E = ' num2str(E) ' | Variance = ' num2str(Variance(subplotNumber))]);
            xlabel('r'); % x-axis label
            ylabel('pdf'); % y-axis label
        end
        hold off
        SaveName = '';
        if independent == 0 % NOT jointly statistically independent
            SaveName = [SaveName 'h-'];
        end
        if strcmp(DECISION_MODE, 'ARBITRARY')
            SaveName = [SaveName 'f-'];
        end
        SaveName = [SaveName num2str(QUESTION) '_E=' num2str(E)];
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
elseif QUESTION == 'g'
    if strcmp(DECISION_MODE, 'OPTIMUM')
        G_error{1} = ErrorList;
        DECISION_MODE = 'ARBITRARY';
        Simulate;
    elseif strcmp(DECISION_MODE, 'ARBITRARY')
        G_error{2} = ErrorList;
        PlotErrorGraph;
    end
else
    PlotErrorGraph;
end
