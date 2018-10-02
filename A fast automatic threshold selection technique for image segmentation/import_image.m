function [ imag, max_gray_level, min_gray_level, number_of_gray_pixels, gray_levels ] = import_image( imag )

%set global veriables that will be used along th algorithm
global max_gray_level min_gray_level number_of_gray_pixels gray_levels

% plot original image
figure, imshow(imag), title('Original image')

% plot image histogram
figure, imhist(imag)
ylim([0,5000])
[number_of_gray_pixels, gray_levels] = imhist(imag);
title('Image histogram')
ylabel('number of pixels')

% plot peaks in the histogram
[P,In] = findpeaks(number_of_gray_pixels);
figure, plot(gray_levels, number_of_gray_pixels,In,P,'o')
title('Peaks in histogram')
xlabel('Gray level')
ylabel('Numer of pixels')

%set the global veriables
imag = double(imag);
max_gray_level=max(max(imag));
min_gray_level=min(min(imag));

end

