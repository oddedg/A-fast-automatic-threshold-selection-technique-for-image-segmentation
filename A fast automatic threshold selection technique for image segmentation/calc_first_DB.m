function [ first_DB ] = calc_first_DB( min_gray_level, first_thresh_gray_level, max_gray_level, number_of_gray_pixels, gray_levels )

%%% calculate first DB index %%%

% devide histogram to bodies
areas_of_bodies = [min_gray_level  first_thresh_gray_level  max_gray_level];

% calculate every bodies variance
variances_of_bodies  = Find_all_variances( areas_of_bodies, number_of_gray_pixels, gray_levels);

% calculate every bodies center
centers = calc_w_centers( min_gray_level,  first_thresh_gray_level,  max_gray_level, number_of_gray_pixels, gray_levels );

R = 0;
for ii = 1:length(centers)   % ii is a body segmented in the image

other_bodies = [1:ii-1 ii+1:length(centers)];
add_variances = variances_of_bodies(ii) + variances_of_bodies(other_bodies);
distance_between_centers = (centers(ii) - centers(other_bodies)).^2;
R(ii)= max(add_variances./distance_between_centers);
end
first_DB = mean(R);

end

