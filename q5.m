%% Plotting Entropy vs RSME with changing c
function [] = q5()
    
    path = 'LAKE.TIF'
    % Classical quantization matrix taken from the internet
    qMat = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

    image = imread(path); 
    DCT = create_mat_dct();
    error = ones(20, 1);
    entropy = error;
    
    %% Running a loop for 20 values of c to plot RSME and Entropy for each value
    for c = 1:20
        % Calling the method for Q3 to get the Quantized DCT of image.
        image2 = q3(path, c);
        [x, y] = size(image2);
        transformedFinal = ones(x, y);
        for i = 1:8:x-7
            for j = 1:8:y-7
                transformedFinal(i:i+7, j:j+7) = myIDCT(myDCT_dequantization(image2(i:i+7, j:j+7), qMat, c), DCT);
            end
        end
        %% Calculating RSME and Entropy
        entropy(c) = My_entropy(uint8(transformedFinal));
        error(c) = RMSE(image, transformedFinal);        
    end
    plot(error, entropy);
    title('Entropy (y-axis) vs RSME (x-axis)');
end