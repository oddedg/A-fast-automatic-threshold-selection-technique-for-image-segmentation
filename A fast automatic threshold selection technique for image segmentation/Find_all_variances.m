function [ variance ] = Find_all_variances( areas_of_bodies, number_of_gray_levels, gray_levels )

for ii = 1:(length(areas_of_bodies)-1)

if ii == 1
current_gray_indx = areas_of_bodies(ii):areas_of_bodies(ii+1) ;
%{
A = indexes_of_gray_pixels(current_gray_indx);
number_of_gray_pixels(current_gray_indx)
reshape_imag = reshape(imag,1,[]);

for ii = 1:length(B)
indx_in_reshape_imag(ii) = find (reshape_imag==A(ii))
end
%}

else
current_gray_indx = areas_of_bodies(ii)+1:areas_of_bodies(ii+1) ;
end


bodie_number_of_gray_levels = number_of_gray_levels(current_gray_indx);
bodie_gray_levels = gray_levels(current_gray_indx);

vector = repelem(bodie_gray_levels, bodie_number_of_gray_levels);
variance(ii) = var(vector);

end
end


