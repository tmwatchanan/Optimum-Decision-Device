Messages = zeros(MESSAGE_COUNT, 1) - 1;

for messageIdx = 1:MESSAGE_COUNT
    if rand() <= PROBABILITY_m0
        Messages(messageIdx) = 0;
    else
        Messages(messageIdx) = 1;
    end
end