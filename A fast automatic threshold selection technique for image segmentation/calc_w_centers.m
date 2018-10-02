function [ centers ] = calc_w_centers( min_gray_level,  thresh_gray_levels,  max_gray_level, number_of_gray_pixels, gray_levels )

areas_of_bodies =[ min_gray_level  thresh_gray_levels  max_gray_level ];

for ii = 1:(length(areas_of_bodies)-1)
if ii==1
current_bodie_area = areas_of_bodies(ii) : areas_of_bodies(ii+1) ; 
else
current_bodie_area = areas_of_bodies(ii)+1 : areas_of_bodies(ii+1) ;
end
current_num_of_gray_levels = number_of_gray_pixels(current_bodie_area)';
current_bodie_gray_levels= gray_levels(current_bodie_area )';

centers(ii) = sum(current_bodie_gray_levels.*current_num_of_gray_levels) / (sum(current_num_of_gray_levels));

end
%{
areas_of_bodies =[ min_gray_level  thresh_gray_levels  max_gray_level ];

for ii = 1:(length(areas_of_bodies)-1)

current_gray_levels = areas_of_bodies(ii) : areas_of_bodies(ii+1) ; 
current_num_of_gray_levels = number_of_gray_pixels(current_gray_levels);
current_num_of_gray_levels = current_num_of_gray_levels';

centers(ii) = sum(current_gray_levels.*current_num_of_gray_levels) / (sum(current_num_of_gray_levels));

end
%}
end

