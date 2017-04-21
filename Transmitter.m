PROBABILITY_m0 = 0.5;
PROBABILITY_m1 = 1 - PROBABILITY_m0;
THRESHOLD = PROBABILITY_m1 / PROBABILITY_m0; % (1-Ps)/Ps
Variance = [1; 1; 1];

AccuracyList = [];
EnergyValue = 0.1:0.1:15;
for energy = 1:length(EnergyValue)
    count = 0;
    for message = 1:50%0000
        m = randi([0 1]); % 0 or 1
        randomNumber = randi([1 length(EnergyValue)], 1, 1);
%         E = EnergyValue(randomNumber);
        E = EnergyValue(energy);
        s = Signal(m, E);
        noise = [GaussianRandom(sqrt(Variance)); GaussianRandom(sqrt(Variance)); GaussianRandom(sqrt(Variance))];
        r = s + noise;
        
        m_hat = [];
        for i = 1:3
            m_hat(i) = ArbitaryDecision(r(i));
            if (m == m_hat(i))
%                 disp(['[i=' num2str(i) '] matched']);
                count = count + 1;
            else
%                 disp(['[i=' num2str(i) '] not-matched']);
            end
        end
    end
    accuracy = (count/3) / message;
    AccuracyList = [AccuracyList; accuracy];
    disp(['[E=' num2str(E) '] Accuracy of Arbitary Decision = ' num2str(errorProbability * 100) '%'])
end
Error = 1 - AccuracyList;
figure;
plot(EnergyValue, Error);