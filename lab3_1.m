clear all; clf; clc;
#
img8 = imread("rzeczka2.png");
img = double(img8) / 255;
gam = 0.7;
img_gc = img.^(1/gam);
#
subplot(1, 2, 1);
imshow(img);
title("org");
subplot(1, 2, 2);
imshow(img_gc);
title("gamma 0.7");
