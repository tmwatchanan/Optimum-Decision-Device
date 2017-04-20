PROBABILITY_m0 = 0.5;
PROBABILITY_m1 = 1 - PROBABILITY_m0;
THRESHOLD = PROBABILITY_m1 / PROBABILITY_m0; % (1-Ps)/Ps
variance = 1;

count = 0;
for time = 1:100
    s = [];
    trasmittedMessages = [];
    receivedMessages = [];
    Energy = 0.1:0.1:15;
    randomNumber = randi([1 length(Energy)], 1, 1);
    E = Energy(randomNumber);
    i = randi([0 1]);
    trasmittedMessages = [trasmittedMessages; i];
    s = [s; Signal( i, E )];
    noise = [GaussianRandom(sqrt(variance)); GaussianRandom(sqrt(variance)); GaussianRandom(sqrt(variance))];
    r = s + noise;
    for i = 1:3
       receivedMessages(i) = ArbitaryDecision(r(i));
    end
    for i = 1:3
        if (trasmittedMessages(1) == receivedMessages(i))
            disp(['[i=' num2str(i) '] matched']);
            count = count + 1;
        else
            disp(['[i=' num2str(i) '] not-matched']);
        end
    end
end
disp(['Accuracy of Arbitary Decision = ' num2str(count/3 * 100/time)])