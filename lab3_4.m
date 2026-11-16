clear all; clf; clc;
#
img8 = imread("rzeczka2.png");
img = double(img8);
#
function wyjscie = PrzytnijZakres(wejscie)
  if(wejscie <= 0)
    wyjscie = 0;
  elseif(wejscie >= 255)
    wyjscie = 255;
  else
    wyjscie = wejscie;
  endif
endfunction
#
LUT_jasn_plus50 = ones(256);
for i = 0:255
  LUT_jasn_plus50(i) = PrzytnijZakres(i + 50);
endfor
#
img_bright = LUT_zastosuj(img, LUT_jasn_plus50);
#
subplot(1, 2, 1);
imshow(img / 255);
title("org");
#
subplot(1, 2, 2);
imshow(img_bright / 255);
title("jasn + 50");
