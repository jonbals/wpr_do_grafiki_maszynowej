clear all; clf; clc;
#
img8 = imread("rzeczka.jpg");
img = double(img8);
#
img_r = img(:,:,1);
img_g = img(:,:,2);
img_b = img(:,:,3);
#
img_y = 0 + 0.299*img_r + 0.587*img_g + 0.114*img_b;
img_cb = 128 - 0.168736*img_r - 0.331264*img_g + 0.5*img_b;
img_cr = 128 + 0.5*img_r - 0.418688*img_g - 0.081312*img_b;
#
subplot(2, 2, 1);
imshow(img/255);
title("RGB");
#
subplot(2, 2, 2);
imshow(img_y/255);
title("Y");
#
subplot(2, 2, 3);
imshow(img_cb/255);
title("Cb");
#
subplot(2, 2, 4);
imshow(img_cr/255);
title("Cr");
