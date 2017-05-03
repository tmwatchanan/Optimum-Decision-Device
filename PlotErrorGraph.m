figure('Name',['Question (' QUESTION ') ' independentString],'NumberTitle','off');
if (QUESTION == 'b')
    semilogy(EnergyValue, B_error{1}); % error of [1 0 0]
    hold on;
    semilogy(EnergyValue, B_error{2}); % error of [1 1 1]
    legend('Based only on r1', 'Based on r1 r2 r3');
elseif (QUESTION == 'g')
    semilogy(EnergyValue, G_error{1}); % error of optimum decision rule
    hold on;
    semilogy(EnergyValue, G_error{2}); % error of arbitrary decision scheme
    legend('Optimum decision rule', 'Arbitrary decision scheme');
else
    semilogy(EnergyValue, ErrorList);
end
title(titleString);
xlabel(xlabelString);
ylabel(ylabelString);

FigureAbout = '_error';
SaveFigure;
