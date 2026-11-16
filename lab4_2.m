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
function wyjscie = SzaroscSrednia(r, g, b)
  wyjscie = (r + g + b) / 3;
endfunction
#
function wyjscie = SzaroscSzary(r, g, b)
  wyjscie = 0.2126*r + 0.7152*g + 0.0722*b;
endfunction
#
img_r = img(:,:,1);
img_g = img(:,:,2);
img_b = img(:,:,3);
img_szary = SzaroscSzary(img_r, img_g, img_b);
img_srednia = SzaroscSrednia(img_r, img_g, img_b);
#
subplot(2, 2, 1);
imshow(img_szary/255);
title("Szary");
#
subplot(2, 2, 2);
imshow(img_srednia/255);
title("Srednia");
#
subplot(2, 2, 3);
imshow(Porownanie_vPS_mnoznik(img_szary, img_srednia, 4)/255);
title("Porownanie v.PS * 4");
#
subplot(2, 2, 4);
imshow(Porownanie_v2_mnoznik(img_szary, img_srednia, 3)/255);
title("Porownanie v.2 * 3");
