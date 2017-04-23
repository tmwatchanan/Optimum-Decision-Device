function [ signal ] = Transmitter(message, E)
    signal = ((-1)^message) * sqrt(E);
end