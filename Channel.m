function [ rArray ] = Channel(signal, noise)
    rArray = bsxfun(@plus,noise,signal);
end