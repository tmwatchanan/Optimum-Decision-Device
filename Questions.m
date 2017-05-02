%% Question (b)
if find(QUESTION == 'b')
    PROBABILITY_m0 = 0.5; % Pm0
    PROBABILITY_m1 = 1 - PROBABILITY_m0; % Pm1
    Variance = zeros(3, 1) + 1;
    Covariance = rand(3, 1);
    selector = [1 0 0];
    B_error = cell(2, 1);
%% Question (c)
elseif find(QUESTION == 'c')
    PROBABILITY_m0 = 0.5; % Pm0
    PROBABILITY_m1 = 1 - PROBABILITY_m0; % Pm1
    Variance = zeros(3, 1) + 1;
    Covariance = rand(3, 1);
    selector = [1 1 1];
%% Question (d)
elseif find(QUESTION == 'd')
    PROBABILITY_m0 = 1/4; % Pm0
    PROBABILITY_m1 = 1 - PROBABILITY_m0; % Pm1
    Variance = zeros(3, 1) + 1;
    Covariance = rand(3, 1);
    selector = [1 1 1];
%% Question (e)
elseif find(QUESTION == 'e')
    PROBABILITY_m0 = 0.5; % Pm0
    PROBABILITY_m1 = 1 - PROBABILITY_m0; % Pm1
    Variance = [1; 2; 4];
    Covariance = rand(3, 1);
    selector = [1 1 1];
%% Question (g)
elseif find(QUESTION == 'g')
    PROBABILITY_m0 = 0.5; % Pm0
    PROBABILITY_m1 = 1 - PROBABILITY_m0; % Pm1
    Variance = zeros(3, 1) + 1;
    Covariance = rand(3, 1);
    selector = [1 1 1];
    DECISION_MODE = 'OPTIMUM';
    G_error = cell(2, 1);
end
%%
titleString = 'Question (' ; % title label
if independent == 0
    titleString = [titleString 'g-'];
end
if strcmp(DECISION_MODE, 'ARBITRARY')
    titleString = [titleString 'f-'];
end
titleString = [titleString num2str(QUESTION) ') '];
if independent == 1
    independentString = 'jointly statistically independent';
else
    independentString = 'NOT jointly statistically independent';
end
titleString = [titleString, [independentString ' | Variance=' mat2str(Variance)], [' Pm0=Pm1=' num2str(PROBABILITY_m0)]];
xlabelString = {'signal energy', 'E=0.1 to 15 (0.1 increment)'};
ylabelString = {'error', 'log scale'};