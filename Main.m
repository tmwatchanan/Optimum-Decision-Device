% independent = 1; % Jointly statistically independent
% independent = 0; % NOT Jointly statistically independent
%% Generate messages
% GenerateMessages;
%%
for independent = 1%:-1:0
    QUESTION = '';
    DECISION_MODE = 'OPTIMUM';
    MESSAGE_COUNT = 50000;
    QUESTION = 'b'; Questions;
    GenerateMessages;
    Simulate;
%     MESSAGE_COUNT = 500000; GenerateMessages;
%     QUESTION = 'c'; Questions;
%     QUESTION = 'd'; Questions;
%     QUESTION = 'e'; Questions;
%     % Question (f) -------------
%     DECISION_MODE = 'ARBITRARY';
%     MESSAGE_COUNT = 10000; GenerateMessages;
%     QUESTION = 'b'; Questions;
%     MESSAGE_COUNT = 500000; GenerateMessages;
%     QUESTION = 'c'; Questions;
%     QUESTION = 'd'; Questions;
%     QUESTION = 'e'; Questions;
end