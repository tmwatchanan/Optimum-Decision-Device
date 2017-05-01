 set(gcf, 'PaperUnits', 'inches');
 x_width=7.25;
 y_width=9.125;
 set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
 SaveName = [SAVE_PATH SaveName '.png'];
 saveas(gcf, SaveName)