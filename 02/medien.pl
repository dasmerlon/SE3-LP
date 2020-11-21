
:- dynamic produkt/7, verkauft/4.        % ermoeglicht dynamische Veraenderung
%:- multifile produkt/7, verkauft/4.      % ermoeglicht verteilte Definition in mehreren Files

% produkt(PId,Kategorie,Titel,Autor,Verlag,Jahr,Lagerbestand).
produkt(12345,buch,sonnenuntergang,hoffmann_susanne,meister,2010,23).
produkt(12346,buch,hoffnung,sand_molly,kasper,2018,319).
produkt(12347,buch,winterzeit,wolf_michael,meister,2011,204).
produkt(12348,buch,blutrache,wolf_michael,meister,2020,0).
produkt(12349,buch,winterzeit,wolf_michael,meister,2015,100).

produkt(23456,ebuch,sonnenuntergang,hoffmann_susanne,meister,2017,1).
produkt(23457,ebuch,spuren_im_schnee,wolf_michael,meister,2018,1).
produkt(23458,ebuch,blutrache,wolf_michael,meister,2020,1).

produkt(34567,hoerbuch,hoffnung,sand_molly,audio,2019,51).
produkt(34568,hoerbuch,winterzeit,wolf_michael,audio,2017,16).

% verkauft(PId,Jahr,Preis,Anzahl).
verkauft(12345,2013,24,391).
verkauft(12345,2014,24,129).
verkauft(12345,2015,24,270).
verkauft(12345,2016,24,350).
verkauft(12345,2017,24,168).
verkauft(12345,2018,24,89).
verkauft(12345,2019,12,6).

verkauft(12346,2018,19,45).
verkauft(12346,2019,20,137).

verkauft(12347,2011,39,71).
verkauft(12347,2012,39,23).
verkauft(12347,2013,39,11).
verkauft(12347,2014,29,15).
verkauft(12347,2015,29,17).
verkauft(12347,2016,29,9).
verkauft(12347,2017,20,8).
verkauft(12347,2018,20,5).
verkauft(12347,2019,20,2).

%verkauft(12348,2020,17,0).

verkauft(12349,2015,29,412).
verkauft(12349,2016,29,257).
verkauft(12349,2017,29,12).
verkauft(12349,2018,17,213).
verkauft(12349,2019,17,23).

verkauft(23456,2017,13,2).
verkauft(23456,2018,13,0).
verkauft(23456,2019,13,1).

verkauft(23457,2014,13,1).
verkauft(23457,2015,13,2).
verkauft(23457,2016,13,1).
verkauft(23457,2018,2,70).
verkauft(23457,2019,2,5).

%verkauft(23458,2020,13,12).

verkauft(34567,2019,21,52).

verkauft(34568,2017,13,23).
verkauft(34568,2018,13,2).
verkauft(34568,2019,9,2).
