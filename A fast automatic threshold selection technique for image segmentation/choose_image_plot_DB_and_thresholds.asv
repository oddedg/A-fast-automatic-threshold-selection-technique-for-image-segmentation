        %%% choose image %%%

%%% House %%%
global imag
imag = imread('house.png');

%%% Lena %%%
%imag = imread('lena512.bmp');


        %%% begining of the algorithm
main;

        %%% find the final search area for the genetic algorithm- GA
areas_of_final_thresholds = find_areas_of_final_thresholds( Final_thresholds, min_gray_level ,first_thresh_gray_level, max_gray_level, Energy );

        %%% find the best thresholds with Genetic Algorithm %%%s
GA;

%%% plot segmented image with the final threshplds after GA %%%
segment_image;


disp('Click on the command line and press a key to terminate')  % Press a key here.You can see the message 'Paused: Press any key' in        % the lower left corner of MATLAB window.
pause;


        %%% close and dellete all%%%
cc;

