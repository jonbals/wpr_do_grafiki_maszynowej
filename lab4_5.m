clear all; clf; clc;
#
img8 = imread("rzeczka.jpg");
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
function wyjscie = Porownanie_vPS_mnoznik(we_stare, we_nowe, mnoznik)
  wyjscie = PrzytnijZakres(mnoznik * abs(we_nowe - we_stare));
endfunction
#
function wyjscie = Porownanie_v2_mnoznik(we_stare, we_nowe, mnoznik)
  wyjscie = PrzytnijZakres(mnoznik * (we_nowe - we_stare) + 127.5);
endfunction
#
img_r = img(:,:,1);
img_g = img(:,:,2);
img_b = img(:,:,3);
#
img_y = 0 + 0.299*img_r + 0.587*img_g + 0.114*img_b;
img_cb = 128 - 0.168736*img_r - 0.331264*img_g + 0.5*img_b;
img_cr = 128 + 0.5*img_r - 0.418688*img_g - 0.081312*img_b;
#zaokraglenie
img_y = round(img_y);
img_cb = round(img_cb);
img_cr = round(img_cr);
#
img_pokonwersji = img;
img_pokonwersji(:,:,1) = round(img_y+1.402*(img_cr-128));
img_pokonwersji(:,:,2) = round(img_y-0.344136*(img_cb-128)-0.714136*(img_cr-128));
img_pokonwersji(:,:,3) = round(img_y+1.772*(img_cb-128));
#
subplot(2, 2, 1);
imshow(img/255);
title("RGB irg");
#
subplot(2, 2, 2);
imshow(img_pokonwersji/255);
title("to YCbCr, to RGB");
#
subplot(2, 2, 3);
imshow(Porownanie_vPS_mnoznik(img, img_pokonwersji, 250)/255);
title("porownanie v.PS * 250");
#
subplot(2, 2, 4);
imshow(Porownanie_v2_mnoznik(img, img_pokonwersji, 300)/255);
title("porownanie v.2 * 300");
