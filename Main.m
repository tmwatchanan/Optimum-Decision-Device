tic;
clear, close all;
%% DEFINE
SAVE_PATH = 'D:\Engineering\Academic Year 2559, 2nd Semester\252301 Engineering Stochastic Processes (3)\Project\figures\';
% independent = 1; % Jointly statistically independent
independent = 0; % NOT Jointly statistically independent
% DECISION_MODE = 'OPTIMUM';
DECISION_MODE = 'ARBITRARY';
MESSAGE_COUNT = 500000;
QUESTION = 'g'; % b, c, d, e, g
Questions;
%% RUN
GenerateMessages;
GenerateNoises;
Simulate;
%%
toc