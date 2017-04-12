%% Proving the perceptual redundancies in YCbCr channel
function [] = q7()
    
    path = '20.jpeg';
    image = imread(path);
    newImage = rgb2ycbcr(image);
    [x, y, z] = size(newImage);
    finalY = ones(x, y, z);
    finalCb = ones(x, y, z);
    finalCr = ones(x, y, z);
    
    Y = newImage(: , :, 1);
    cb = newImage(: , :, 2);
    cr = newImage(: , :, 3);
    
    noiseyY = imnoise(Y, 'gaussian');
    noiseyCb = imnoise(cb, 'gaussian');
    noiseyCr = imnoise(cr, 'gaussian');
    
    figure, imshow(image);
    title('Original Image');
    figure, imshow(ycbcr2rgb(cat(3, noiseyY, cb, cr)));
    title('Noise in Y channel');
    figure, imshow(ycbcr2rgb(cat(3, Y, noiseyCb, cr)));
    title('Noise in Cr channel');
    figure, imshow(ycbcr2rgb(cat(3, Y, cb, noiseyCr)));
    title('Noise in Cb channel');
end