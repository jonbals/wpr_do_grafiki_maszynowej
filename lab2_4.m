clf; clc; clear all;
%
plaza8 = imread("plaza1.png");
plaza = double(plaza8);
%
subplot(4, 3, [1 4]);
imshow(plaza/255);
%
subplot(4, 3, 2);
hist(vec(plaza), 100);
title("R+G+B");
xlim([0 255]);
%
subplot(4, 3, 3);
hist(vec(plaza(:, :, 1)), 100);
title("R");
xlim([0 255]);
%
subplot(4, 3, 5);
hist(vec(plaza(:, :, 2)), 100);
title("G");
xlim([0 255]);
%
subplot(4, 3, 6);
hist(vec(plaza(:, :, 3)), 100);
title("B");
xlim([0 255]);
%
plaza_obrobka = plaza;
r_min = min(vec(plaza(:, :, 1)));
r_max = max(vec(plaza(:, :, 1)));
plaza_obrobka(:, :, 1) = ((plaza(:, :, 1) - r_min) / (r_max - r_min)) * 255;
g_min = min(vec(plaza(:, :, 2)));
g_max = max(vec(plaza(:, :, 2)));
plaza_obrobka(:, :, 2) = ((plaza(:, :, 2) - g_min) / (g_max - g_min)) * 255;
b_min = min(vec(plaza(:, :, 3)));
b_max = max(vec(plaza(:, :, 3)));
plaza_obrobka(:, :, 3) = ((plaza(:, :, 3) - b_min) / (b_max - b_min)) * 255;
%
subplot(4, 3, [7 10]);
imshow(plaza_obrobka/255);
%
subplot(4, 3, 8);
hist(vec(plaza_obrobka), 100);
title("R+G+B");
xlim([0 255]);
%
subplot(4, 3, 9);
hist(vec(plaza_obrobka(:, :, 1)), 100);
title("R");
xlim([0 255]);
%
subplot(4, 3, 11);
hist(vec(plaza_obrobka(:, :, 2)), 100);
title("G");
xlim([0 255]);
%
subplot(4, 3, 12);
hist(vec(plaza_obrobka(:, :, 3)), 100);
title("B");
xlim([0 255]);


