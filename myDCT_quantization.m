function [imqDCT] = myDCT_quantization(imDCT, qm, c)
    imqDCT = round(imDCT./(qm*c));
end