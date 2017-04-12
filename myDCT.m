function [DCT] = myDCT(im, F)
    DCT = F*double(im)*F';
end