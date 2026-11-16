clear all; clf; clc;

img8 = imread("rzeczka_mniejsza.jpg");
img = double(img8);

img_r = img(:, :, 1);
img_g = img(:, :, 2);
img_b = img(:, :, 3);

# skalowanie do zakresu [0; 1]
img_r /= 255;
img_g /= 255;
img_b /= 255;

max_rgb = max(max(img_r, img_g), img_b);
min_rgb = min(min(img_r, img_g), img_b);
chroma = max_rgb - min_rgb;

# obliczanie H (hue)
img_h = chroma;
chroma_test = chroma <= 0.001;
r_test = and(img_r == max_rgb, !chroma_test);
g_test = and(img_g == max_rgb, !chroma_test);
b_test = and(img_b == max_rgb, !chroma_test);
img_h(chroma_test) = 0;
img_h(r_test) = mod((img_g - img_b)./chroma, 6)(r_test);
img_h(g_test) = (((img_b - img_r)./chroma) + 2)(g_test);
img_h(b_test) = (((img_r - img_g)./chroma) + 4)(b_test);
img_h = img_h * 60;

# obliczanie L (lightness)
img_l = (max_rgb + min_rgb) / 2;

# obliczanie S (saturation)
img_s = img_l;
l_test = (img_l <= 0.001) | (img_l >= 0.999);
img_s(l_test) = 0;
img_s(!l_test) = (chroma ./ (1 - abs(2 * img_l - 1)))(!l_test);
img_l *= 255;
img_s *= 255;

subplot(2, 2, 1);
imshow(img/255);
title("RGB");

subplot(2, 2, 2);
imshow(img_h/255);
title("Hue");

subplot(2, 2, 3);
imshow(img_s/255);
title("Saturation");

subplot(2, 2, 4);
imshow(img_l/255);
title("Lightness");
