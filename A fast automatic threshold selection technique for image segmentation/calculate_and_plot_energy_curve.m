function [Energy] = calculate_and_plot_energy_curve( min_gray_level, max_gray_level, imag)


%initial the energy 
Energy = zeros(1,256);

% calculate the energy for every gray value
for ii = min_gray_level:max_gray_level

gray_level=ii;
% generate binry matrix for the current gray level 
B_mat = B_matrix( imag, gray_level ) ;

% generate the 2nd neighbor
B_N2 = N2_neighbohood( B_mat ) ;

% Calculate first part of the energy 
E_left = Energy_left( B_mat, B_N2 );

% Calculate the conatant, to prevent energy from being negative 
E_right = Energy_right( imag );

Energy(gray_level+1) = E_left+E_right;

end

figure, plot( 0:255 , Energy)
xlim([0 260])
title('Energy curve')
xlabel('Gray level')
ylabel('Energy')

figure, plot( 0:255 , Energy)
hold on
xlim([0 260])
title('Peaks and first thresholds in energy curve')
xlabel('Gray level')
ylabel('Energy')


end

