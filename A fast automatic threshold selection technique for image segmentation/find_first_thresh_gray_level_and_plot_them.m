function [ first_thresh_gray_level  ] = find_first_thresh_gray_level_and_plot_them(  Energy, min_gray_level, max_gray_level )

first_thresh_gray_level  = find_first_thresh( Energy, min_gray_level, max_gray_level );
for ii = 1:size(first_thresh_gray_level,2)

    line([ first_thresh_gray_level(ii) first_thresh_gray_level(ii) ], [0 max(Energy(first_thresh_gray_level(ii)))]);

end
hold off

end

