% In class 18
%GB comments
1. 100
2. 100
Overall: 100


% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.  

file = 'yeast.tif';
img = imread(file);

% Smooth image
rad = 7;
sigma = 5;
fgauss = fspecial('gaussian', rad, sigma);
img_smooth = imfilter(img, fgauss);

% Find edges
hx = fspecial('sobel');
hy = hx';
Iy = imfilter(double(img_smooth), hy, 'replicate');
Ix = imfilter(double(img_smooth), hx, 'replicate');
edge_img = sqrt(Ix.^2 + Iy.^2);

% Find circles
[centers, radii] = imfindcircles(edge_img, [16 40], 'Sensitivity', 0.9);
figure
imshow(img,[])
hold on
for circ = 1:length(centers)
   
    drawcircle(centers(circ,:),radii(circ),'r');
    
end

%%
% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 

% (A)
rands1 = randi(9,1,10);
rands2 = randi(10,1,10);
[is_sig, pval] = ttest2(rands1, rands2);

% (B)
rands1 = randi(4,1,10);
rands2 = randi(4,1,10);
[is_sig2, pval2] = ttest2(rands1, rands2);

rands1 = randi(12,1,10);
rands2 = randi(7,1,10);
[is_sig3, pval3] = ttest2(rands1, rands2);

rands1 = randi(5,1,10);
rands2 = randi(16,1,10);
[is_sig4, pval4] = ttest2(rands1, rands2);

disp(is_sig)
disp(is_sig2)
disp(is_sig3)
disp(is_sig4)

% The sets of random numbers drawing from similar ranges of integers tend
% to not have a significant difference in the means. The sets of random
% numbers drawing from very different ranges of integers (the last two)
% tend to have significantly different means.

% (C)
rands1 = randi(9,1,100);
rands2 = randi(10,1,100);
[is_sig, pval] = ttest2(rands1, rands2);

rands1 = randi(4,1,100);
rands2 = randi(4,1,100);
[is_sig2, pval2] = ttest2(rands1, rands2);

rands1 = randi(12,1,100);
rands2 = randi(7,1,100);
[is_sig3, pval3] = ttest2(rands1, rands2);

rands1 = randi(5,1,100);
rands2 = randi(16,1,100);
[is_sig4, pval4] = ttest2(rands1, rands2);

disp('-----------------------------')
disp(is_sig)
disp(is_sig2)
disp(is_sig3)
disp(is_sig4)

rands1 = randi(9,1,1000);
rands2 = randi(10,1,1000);
[is_sig, pval] = ttest2(rands1, rands2);

rands1 = randi(4,1,1000);
rands2 = randi(4,1,1000);
[is_sig2, pval2] = ttest2(rands1, rands2);

rands1 = randi(12,1,1000);
rands2 = randi(7,1,1000);
[is_sig3, pval3] = ttest2(rands1, rands2);

rands1 = randi(5,1,1000);
rands2 = randi(16,1,1000);
[is_sig4, pval4] = ttest2(rands1, rands2);

disp('-----------------------------')
disp(is_sig)
disp(is_sig2)
disp(is_sig3)
disp(is_sig4)

% The set of random numbers that draws from the same range of integers (the
% second case) tends to show no significant difference between the means,
% while the other sets of random numbers which draw from different ranges
% of integers tend to show significant differences between the means, as
% the number of integers goes from 10 to 1000. This is because the law of
% large numbers dictates that the means of each data set will approach the
% predicted mean with more integers in the sample, so the sets with
% predicted means that are equal (i.e. they have the same max integer)
% should not be significantly different, while the sets with different
% predicted means (i.e. they draw from different max integers) should show
% significant difference.
