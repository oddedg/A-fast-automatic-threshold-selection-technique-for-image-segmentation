function [ first_thresh_indx ] = find_first_thresh( Energy, min_gray_level, max_gray_level )

[Peaks,Peaks_indx] = findpeaks(Energy);
plot (Peaks_indx, Peaks, 'o')
Peaks_indx_include_sides =[min_gray_level Peaks_indx max_gray_level]; 

Diff = diff(Peaks_indx_include_sides);

first_thresh_indx = Peaks_indx_include_sides( [ 1 : size(Peaks_indx_include_sides,2)-1 ] );
first_thresh_indx = first_thresh_indx + round(Diff/2) ;

end

