function [ B_N2 ] = N2_neighbohood( B_mat )

f = [1 1 1 ; 1 0 1 ; 1 1 1 ]; %filter
B_N2 = conv2(B_mat ,f , 'same');
end