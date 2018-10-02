function [ E_left ] = Energy_left( B_mat, B_N2 )

E_left = -sum(sum(B_mat.* B_N2));

end

