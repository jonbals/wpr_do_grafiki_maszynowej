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
we_min = min(vec(plaza));
we_max = max(vec(plaza));
plaza_obrobka = plaza - we_min;
plaza_obrobka /= (we_max - we_min);
plaza_obrobka *= 255;
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


