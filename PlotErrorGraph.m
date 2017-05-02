save = true;
if (QUESTION == 'b')
    if isequal(selector, [1 1 1])
        figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
        semilogy(EnergyValue, B_error{1}); % error of [1 0 0]
        hold on;
        semilogy(EnergyValue, B_error{2}); % error of [1 1 1]
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
    SaveName = '';
    if independent == 0 % NOT jointly statistically independent
        SaveName = [SaveName 'h-'];
    end
    if strcmp(DECISION_MODE, 'ARBITRARY')
        SaveName = [SaveName 'f-'];
    end
    SaveName = [SaveName num2str(QUESTION) '_error'];
    SaveFigure;
end