function [entropy] = My_entropy(im)
    [counts, binLoc] = imhist(im);
    totalSum = sum(counts);
    entropy = 0;
    for i = 1:256
        if counts(i) > 0
            p = counts(i)/totalSum;
            entropy = entropy-p*log2(p);
        end
    end
end