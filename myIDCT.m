function [invDCT] = myIDCT(im, F)
    invDCT = F'*double(im)*F;
end