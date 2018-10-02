function [ B ] = B_matrix( imag, gray_level )

curr_gray_level = gray_level ;

indx = find( imag > curr_gray_level ) ;

B = -1 * ones(size(imag));
B(indx) = 1;


end

