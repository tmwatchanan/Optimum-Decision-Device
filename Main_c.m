% clear;
% close all;
%% Question (b)
% Equal probabilities and variances
PROBABILITY_m0 = 0.5; % Pm0
PROBABILITY_m1 = 1 - PROBABILITY_m0; % Pm1
Variance = zeros(3, 1) + 1;
MESSAGE_COUNT = 500000;
selector = [1 1 1];
%%
AccuracyList = [];
EnergyValue = 0.1:0.1:15;
for energy = 1:length(EnergyValue)
    count = 0;
    for message = 1:MESSAGE_COUNT
        m = randi([0 1]); % random m0 or m1
        E = EnergyValue(energy);
        s = Transmitter(m, E);
        independent = 1; % Jointly statistically independent
        r = Channel(independent, s, Variance);
        ratio = PROBABILITY_m0 / PROBABILITY_m1; % P0/P1
        m_hat = OptimumDecisionRule(s, r, ratio, selector);
        if (m_hat == m)
            count = count + 1;
        end
    end
    accuracy = count / message;
    AccuracyList = [AccuracyList; accuracy];
%     disp(['[E=' num2str(E) '] Accuracy of Arbitary Decision = ' num2str(accuracy * 100) '%'])
end
Error = 1 - AccuracyList;
figure;
plot(EnergyValue, log(Error));
title(['Graph of question (b) ', ['Variance=' mat2str(Variance)], [' Pm0=Pm1=' num2str(PROBABILITY_m0)]]);
xlabel({'signal energy', 'E=0.1 to 15 (0.1 increment)'}); % x-axis label
ylabel({'error', 'log scale'}); % y-axis label