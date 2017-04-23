% independent = 1; % Jointly statistically independent
% independent = 0; % NOT Jointly statistically independent
%% Generate messages
GenerateMessages;
%%
for independent = 1%:-1:0
    QUESTION = '';
    DECISION_MODE = 'OPTIMUM';
    QUESTION = 'b'; Questions;
%     QUESTION = 'c'; Questions;
%     QUESTION = 'd'; Questions;
%     QUESTION = 'e'; Questions;
%     % Question (f) -------------
%     DECISION_MODE = 'ARBITRARY';
%     QUESTION = 'b'; Questions;
%     QUESTION = 'e'; Questions;
end