function [ areas_of_final_thresholds ] = find_areas_of_final_thresholds( Final_thresholds, min_gray_level, first_thresh_gray_level, max_gray_level, Energy )


initial_areas_of_bodies = [min_gray_level first_thresh_gray_level max_gray_level];

[Peaks,Peaks_indx] = findpeaks(Energy);
initial_areas_of_thresholds = [min_gray_level Peaks_indx max_gray_level];

areas_of_final_thresholds = NaN;
for ii = 1:length(Final_thresholds)
    
first_index = max (find (Final_thresholds(ii) > initial_areas_of_thresholds));
start = initial_areas_of_thresholds(first_index)+1;
 
second_index =  min(find(Final_thresholds(ii) < initial_areas_of_thresholds));
stop = initial_areas_of_thresholds(second_index)-1;

areas_of_final_thresholds = [areas_of_final_thresholds, start, stop];

end

real_values_indx = (~isnan(areas_of_final_thresholds));
areas_of_final_thresholds = areas_of_final_thresholds(real_values_indx);

end

