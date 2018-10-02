function [ DB_for_GA ] = calc_DB_for_GA(  Final_thresholds )

global max_gray_level min_gray_level number_of_gray_pixels gray_levels DB_count_glob DB_count_glob_count

%{
if Final_thresholds(1)==16
Final_thresholds=17
end

if Final_thresholds(length(Final_thresholds))==255
Final_thresholds(length(Final_thresholds))==254
end
%}
%%% calculate DB_for GA index %%%

% devide histogram to bodies
Final_thresholds = round(Final_thresholds);
areas_of_bodies = [min_gray_level  Final_thresholds  max_gray_level];

% calculate every bodies variance
areas_of_bodies = round(areas_of_bodies);
variances_of_bodies  = Find_all_variances( areas_of_bodies, number_of_gray_pixels, gray_levels);

% calculate every bodies center
centers = calc_w_centers( min_gray_level,  Final_thresholds,  max_gray_level, number_of_gray_pixels, gray_levels );

R = 0;
for ii = 1:length(centers)   % ii is a body segmented in the image

other_bodies = [1:ii-1 ii+1:length(centers)];
add_variances = variances_of_bodies(ii) + variances_of_bodies(other_bodies);
distance_between_centers = (centers(ii) - centers(other_bodies)).^2;
R(ii)= max(add_variances./distance_between_centers);
end

DB_for_GA = mean(R);

end

