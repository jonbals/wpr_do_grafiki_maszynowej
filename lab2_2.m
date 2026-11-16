clf; clc; clear all;
%
plaza8 = imread("plaza1.png");
plaza = double(plaza8);
%
subplot(2, 2, 1);
hist(vec(plaza), 100);
title("R+G+B");
%
subplot(2, 2, 2);
hist(vec(plaza(:, :, 1)), 100);
title("R");
%
subplot(2, 2, 3);
hist(vec(plaza(:, :, 2)), 100);
title("G");
%
subplot(2, 2, 4);
hist(vec(plaza(:, :, 3)), 100);
title("B");


