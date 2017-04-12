function [error] = RMSE(im1, im2)
    errorSquare = (single(im1)-single(im2)).^2;
    error = sqrt(sum(errorSquare(:))/numel(im1));
end