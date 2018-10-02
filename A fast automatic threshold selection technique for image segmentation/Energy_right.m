function [ E_right ] = Energy_right(imag)

%creat C matrix
C_mat = 1 * ones(size(imag));

%add 2nd nearrest neighbour
f = [1 1 1 ; 1 0 1 ; 1 1 1 ]; %filter
C_N2 = conv2(C_mat ,f , 'same');

E_right = sum(sum(C_mat.* C_N2));


end

