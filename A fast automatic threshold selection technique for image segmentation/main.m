% import a BW image
[ imag, max_gray_level, min_gray_level, number_of_gray_pixels, gray_levels ] = import_image(imag) ;

%calculate and plot the energy curve
Energy = calculate_and_plot_energy_curve( min_gray_level, max_gray_level, imag);

%find all first thesholds indexes, and mark them to the graph
first_thresh_gray_level  = find_first_thresh_gray_level_and_plot_them(  Energy, min_gray_level, max_gray_level );
disp(['First thresholds= ', num2str(first_thresh_gray_level)])

  
%%% calculate the first DB %%%

DB(1) = calc_first_DB( min_gray_level, first_thresh_gray_level, max_gray_level, number_of_gray_pixels, gray_levels );
disp(['First DB before GA= ', num2str(DB(1))])

current_thresholds = first_thresh_gray_level;
all_DBs_thresholds(1) = {current_thresholds};


%%% calculate second DB and above %%%
for ii = 1:( length(first_thresh_gray_level)-1)
 

[ checked_thresholds, DB_checked ] = calculate_second_DB_and_above( current_thresholds, min_gray_level, max_gray_level, number_of_gray_pixels, gray_levels );

current_thresholds = checked_thresholds;

DB(ii + 1) = DB_checked;
all_DBs_thresholds(ii + 1) = {current_thresholds};

number_of_thresholds(ii+1) = length(current_thresholds);


end


% find 
Final_DB = min(DB);


ind = find(DB == Final_DB);
Final_thresholds = cell2mat( all_DBs_thresholds(ind) );

initial_areas = [min_gray_level first_thresh_gray_level max_gray_level];

disp(['Final thresholds before GA= ', num2str(cell2mat( all_DBs_thresholds(ind) ))])
disp(['Final DB before GA= ', num2str(Final_DB)])



