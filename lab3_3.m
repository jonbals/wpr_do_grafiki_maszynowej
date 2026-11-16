clear all; clf; clc;
#
img8 = imread("rzeczka2.png");
img = double(img8);
#
function retval = ZmienJasnosc (wejscie, wspJasnosci)
  retval = PrzytnijZakres(wejscie + wspJasnosci);
endfunction;
#
function retval = PrzytnijZakres(wejscie)
  if(wejscie <= 0)
    retval = 0;
  elseif(wejscie >= 255)
    retval = 255;
  else
    retval = wejscie;
  endif
endfunction;
#
img_dark = ZmienJasnosc(img, -50);
img_bright = ZmienJasnosc(img, 50);
#
subplot(1, 3, 1);
imshow(img_dark / 255);
title("jasn -50");
#
subplot(1, 3, 2);
imshow(img / 255);
title("org");
#
subplot(1, 3, 3);
imshow(img_bright / 255);
title("jasn + 50");
