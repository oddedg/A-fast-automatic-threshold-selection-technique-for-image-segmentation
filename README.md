# A-fast-automatic-threshold-selection-technique-for-image-segmentation
An implementation of a thresholds selection technique for image segmentation written in the above article.

The method described above can deal with multilevel histograms, which means there are few thresholds to be detected. the idea is to create the "ENERGY CURVE", which look like a smoother version of the image histogram, choose the right number and search area for the optimal number of thresholds, using "DB INDEX", and finally calculate the final thresholds using genetic algorithm.

The zip file contains all the functions and scripts neaded. To use the algorithm download and unzip, open the script "choose_image_plot_DB_and_thresholds", choose an image by changing the # location, and wait for the algorithm to plot some graphs and the segmented image.

This work was done during the course "Selected Topics in Image Processing" num 377.2.5211, Electro-opticals masters degree, at BGU UNIVERSITY.
