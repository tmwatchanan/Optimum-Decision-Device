%% Question (b)
if find(QUESTION == 'b')
    PROBABILITY_m0 = 0.5; % Pm0
    PROBABILITY_m1 = 1 - PROBABILITY_m0; % Pm1
    Variance = zeros(3, 1) + 1;
    Covariance = [0.3; 0.6; 0.9];
%     MESSAGE_COUNT = 10000;
    selector = [1 0 0];
    B_error = cell(2, 1);
%% Question (c)
elseif find(QUESTION == 'c')
    % Equal probabilities and variances
    PROBABILITY_m0 = 0.5; % Pm0
    PROBABILITY_m1 = 1 - PROBABILITY_m0; % Pm1
    Variance = zeros(3, 1) + 1;
    Covariance = [0.3; 0.6; 0.9];
%     MESSAGE_COUNT = 500000;
    selector = [1 1 1];
%% Question (d)
elseif find(QUESTION == 'd')
    % Equal probabilities and variances
    PROBABILITY_m0 = 1/4; % Pm0
    PROBABILITY_m1 = 1 - PROBABILITY_m0; % Pm1
    Variance = zeros(3, 1) + 1;
    Covariance = [0.3; 0.6; 0.9];
%     MESSAGE_COUNT = 500000;
    selector = [1 1 1];
%% Question (e)
elseif find(QUESTION == 'e')
    % Equal probabilities and variances
    PROBABILITY_m0 = 0.5; % Pm0
    PROBABILITY_m1 = 1 - PROBABILITY_m0; % Pm1
    Variance = [1; 2; 4];
%     MESSAGE_COUNT = 500000;
    selector = [1 1 1];
end
%%
titleString = ['Graph of question (' QUESTION ') ']; % title label
if independent == 1
    independentString = 'jointly statistically independent';
else
    independentString = 'NOT jointly statistically independent';
end
titleString = [titleString, [independentString ' | Variance=' mat2str(Variance)], [' Pm0=Pm1=' num2str(PROBABILITY_m0)]];
xlabelString = {'signal energy', 'E=0.1 to 15 (0.1 increment)'}; % x-axis label
ylabelString = {'error', 'log scale'}; % y-axis label
%%