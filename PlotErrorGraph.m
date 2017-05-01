save = true;
if (QUESTION == 'b')
    if isequal(selector, [1 1 1])
        figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
        semilogy(EnergyValue, B_error{1}); % error of [1 0 0]
        hold on;
        semilogy(EnergyValue, B_error{2}); % error of [1 1 1]
        hold off
        legend('based only on r1','based on r1 r2 r3')
    else
        save = false;
    end
else
    figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
    semilogy(EnergyValue, ErrorList);
end
title(titleString);
xlabel(xlabelString);
ylabel(ylabelString);

if save
    if independent == 1 % Jointly statistically independent
        if strcmp(DECISION_MODE, 'ARBITARY')
            SaveName = ['h-f-' num2str(QUESTION) '_error'];
        else
            SaveName = [num2str(QUESTION) '_error'];
        end
    else % NOT jointly statistically independent
        if strcmp(DECISION_MODE, 'ARBITARY')
            SaveName = ['h-f-' num2str(QUESTION) '_error'];
        else
            SaveName = ['h-' num2str(QUESTION) '_error'];
        end
    end
    SaveFigure;
end