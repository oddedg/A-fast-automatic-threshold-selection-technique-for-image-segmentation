function [ checked_thresholds, DB ] = calculate_second_DB_and_above( current_thresholds, min_gray_level, max_gray_level, number_of_gray_pixels, gray_levels )

%( min_gray_level, first_thresh_gray_level, max_gray_level, number_of_gray_pixels, gray_levels )

%%% calculate second DB and above %%%


for excludes_threshola_index = 1:length(current_thresholds)

% devide histogram to bodies
checked_thresholds_indexes = [1:excludes_threshola_index-1 excludes_threshola_index+1:length(current_thresholds)];
checked_thresholds = current_thresholds(checked_thresholds_indexes);
areas_of_bodies = [min_gray_level  checked_thresholds  max_gray_level];


% calculate every bodies variance
variances_of_bodies  = Find_all_variances( areas_of_bodies, number_of_gray_pixels, gray_levels);

% calculate every bodies center
centers = calc_w_centers( min_gray_level,  checked_thresholds,  max_gray_level, number_of_gray_pixels, gray_levels );

R = 0;
for ii = 1:length(centers)   % ii is a body segmented in the image

other_bodies = [1:ii-1 ii+1:length(centers)];
add_variances = variances_of_bodies(ii) + variances_of_bodies(other_bodies);
distance_between_centers = (centers(ii) - centers(other_bodies)).^2;
R(ii)= max(add_variances./distance_between_centers);
end
DB(excludes_threshola_index) = mean(R);
end

index_of_min_DB = find(DB == min(DB));
checked_thresholds_indexes = [1:index_of_min_DB-1 index_of_min_DB+1:length(current_thresholds)];

checked_thresholds = current_thresholds(checked_thresholds_indexes);

DB = min(DB);

end

