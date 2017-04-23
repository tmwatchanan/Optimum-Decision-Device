function [ rArray ] = Channel(independent, signal, variance)
    rArray = [];
    if independent == 1 % Jointly statistically independent
        noise = GaussianRandom(sqrt(variance(1:3)));
        rArray = noise + signal;
    else % NOT jointly statistically independent
        
    end
end

