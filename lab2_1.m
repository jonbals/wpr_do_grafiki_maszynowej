clf; clc; clear all;
%
plaza8 = imread("plaza1.png");
plaza = double(plaza8);
plaza_swap = plaza;
plaza_swap(:, :, 1) = plaza(:, :, 3);
plaza_swap(:, :, 3) = plaza(:, :, 1);
imshow(plaza_swap/255);

