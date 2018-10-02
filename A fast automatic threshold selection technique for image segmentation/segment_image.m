
SegmentedImage = ones(size(imag));
SegmentedImage = uint8(SegmentedImage);
%SegmentedImage([100:120],:) = 1 ;
%imshow(SegmentedImage)
%global imag
%Final_thresholds_after_GA = [5 130 200]
%imag = imread('lena512.bmp');
%imag = imread('house.png');

%imshow(imag)

 % calculate the final gray levels to be presented in the vector "final_gray_levels_after_GA"
number_of_final_gray_levels = length(Final_thresholds_after_GA)+1 ; % equal to num of areas
gray_level_gap = round(255 / (number_of_final_gray_levels-1)) ;  
middle_final_gray_levels = (1:length(Final_thresholds_after_GA)-1).*gray_level_gap;
final_gray_levels_after_GA = [ 0 middle_final_gray_levels 255 ] ;
%final_gray_levels_after_GA = flip(final_gray_levels_after_GA)

for ii = 1:length(Final_thresholds_after_GA)
    if ii == 1
indexes = find (imag <= Final_thresholds_after_GA(ii));
SegmentedImage(indexes) = final_gray_levels_after_GA(ii) ;
    else
        indexes = find (imag <= Final_thresholds_after_GA(ii)  & imag > Final_thresholds_after_GA(ii-1)) ;
        
    end
    
    SegmentedImage(indexes) = final_gray_levels_after_GA(ii) ;



end
 % set pixels above the top "Final_thresholds_after_GA" to 255
indexes = find (imag > Final_thresholds_after_GA(ii));
SegmentedImage(indexes) = final_gray_levels_after_GA(ii+1);
figure(), imshow(SegmentedImage), title ('Segmented Image')