SaveName = '';
if independent == 0 % NOT jointly statistically independent
    SaveName = [SaveName 'h-'];
end
if strcmp(DECISION_MODE, 'ARBITRARY')
    SaveName = [SaveName 'f-'];
end
SaveName = [SaveName num2str(QUESTION) FigureAbout];
set(gcf, 'PaperUnits', 'inches');
x_width=7.25;
y_width=9.125;
set(gcf, 'PaperPosition', [0 0 x_width y_width]);
SaveName = [SAVE_PATH SaveName '.png'];
saveas(gcf, SaveName)