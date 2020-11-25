:- dynamic kategorie/3.        % ermoeglicht dynamische Veraenderung
%:- multifile kategorie/3.      % ermoeglicht verteilte Definition in mehreren Files

% kategorie(Id_Unterkategorie,Name_Unterkategorie,Id_Oberkategorie)
kategorie(1,buch,0).
kategorie(2,ebuch,0).
kategorie(3,hoerbuch,0).
kategorie(4,kinder,1).
kategorie(5,kinder,2).
kategorie(6,kinder,3).
kategorie(7,krimi,1).
kategorie(8,krimi,2).
kategorie(9,krimi,3).
kategorie(10,roman,1).
kategorie(11,roman,2).
kategorie(12,roman,3).
kategorie(13,sachbuch,1).
kategorie(14,sachbuch,2).
kategorie(15,bilderbuch,4).
kategorie(16,reisefuehrer,13).
kategorie(17,lexikon,13).
kategorie(18,lyrik,1).
kategorie(19,lyrik,3).
kategorie(20,bastelbuch,4).
kategorie(21,woerterbuch,13).

% produkt(PId,KId,Titel,Autor,Verlag,Jahr,Lagerbestand).
produkt(12345,10,sonnenuntergang,hoffmann_susanne,meister,2010,23).
produkt(12346,18,hoffnung,sand_molly,kasper,2015,319).
produkt(12347,7,winterzeit,wolf_michael,meister,2011,0).
produkt(12348,7,blutrache,wolf_michael,meister,2007,200).
produkt(12349,7,winterzeit,wolf_michael,meister,2015,100).

produkt(23456,11,sonnenuntergang,hoffmann_susanne,meister,2014,1).
produkt(23457,11,spuren_im_schnee,wolf_michael,meister,2014,1).
produkt(23458,8,blutrache,wolf_michael,meister,2015,1).

produkt(34567,19,hoffnung,sand_molly,audio,2016,51).
produkt(34568,9,winterzeit,wolf_michael,audio,2017,16).

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

