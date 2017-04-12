function [basis] = create_mat_dct()
    basis = ones(8, 8);
    N = 8;
    r = sqrt(1/N);
    for v = 0:7
        for u = 0:7
            basis(v+1, u+1) = r*cos(pi*(2*u+1)*v/(2*N));
        end
        r = sqrt(2/N);
    end
end