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
function wyjscie = Porownanie_vPS(we_stare, we_nowe)
  wyjscie = abs(we_nowe - we_stare);
endfunction
#
function wyjscie = Porownanie_v2(we_stare, we_nowe)
  wyjscie = PrzytnijZakres((we_nowe - we_stare) + 127.5);
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
gam = 1.5;
img_gc = ((img/255).^(1/gam))*255;
#
subplot(2, 2, 1);
imshow(img/255);
title("org");
#
subplot(2, 2, 2);
imshow(img_gc/255);
title("gamma 1.5");
#
subplot(2, 2, 3);
imshow(Porownanie_vPS_mnoznik(img, img_gc, 4)/255);
title("Porownanie v.PS * 4");
#
subplot(2, 2, 4);
imshow(Porownanie_v2_mnoznik(img, img_gc, 3)/255);
title("Porownanie v.2 * 3");
