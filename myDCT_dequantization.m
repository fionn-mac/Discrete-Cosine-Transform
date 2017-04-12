function [imdqDCT] = myDCT_dequantization(imqDCT, qm, c)
    imdqDCT = imqDCT.*(qm*c);
end