%% Finding highest compression factor s.t. distortions are just perceptible
function [c] = q4()
    
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

    figure, imshow(imread(path));
    title('Original Image')
     a = input('View original image and then press any key to continue');
    
    DCT = create_mat_dct();
    
    for c = 1:3
        % Calling the method for Q3 to get the Quantized DCT of image.
        image = q3(path, c);
        [x, y] = size(image);
        transformedFinal = ones(x, y);
        for i = 1:8:x-7
            for j = 1:8:y-7
                transformedFinal(i:i+7, j:j+7) = myIDCT(myDCT_dequantization(image(i:i+7, j:j+7), qMat, c), DCT);
            end
        end
        figure, imshow(transformedFinal,[0 255]);
        title('Compressed Image')
         a = input('Input 1 if the image is clearly perceptible');
         if a ~= 1
             c = c-1;
             break
         end
    end
end