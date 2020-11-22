/**
SE3-LP WiSe 2020/2021
Übung Gr.04:
    Merle Hoffmann      (7031673)
    Lukas Kiefer        (7260745)
    Björn Mutschinski   (7029008)

Aufgabenblatt 2:
Aufgabe 3.3:
*/

:- dynamic schueler/6, klasse/4, lehrer/4, veranstaltung/7, note/3.                
% ermoeglicht dynamische Veraenderung
%:- multifile schueler/7, klasse/4, lehrer/4, veranstaltung/7, note/3.                
% ermoeglicht verteilte Definition in mehreren Files

%schueler(SchuelerId,KlassenId,Name,Geburtstag,Adresse,Ort).
schueler(12345,23456,bader_laura,'12.02.2012',hartzloh_13,hamburg).
schueler(12346,23458,loose_frieda,'30.09.2010',neukoppel_6,hamburg).
schueler(12347,23456,landsmann_sebastian,'12.02.2012',gernroder_weg_81,hamburg).
schueler(12348,23458,baake_jacob,'05.10.2009',griesstrasse_2,hamburg).
schueler(12349,23457,urchs_jan-philipp,'07.12.2010',kegelhoffstrasse_28,hamburg).
schueler(12350,23457,hermes_franziska,'22.02.2011',triftheide_84,hamburg).

%klasse(KlassenId,LehrerId,Klasse,Raum).
klasse(23456,34568,'2a',13).
klasse(23457,34567,'3c',13).
klasse(23458,34571,'4b',13).

%lehrer(LehrerId,Name,Adresse,Ort).
lehrer(34567,marks_kerstin,fasanenstrasse_23,hamburg).
lehrer(34568,erber_jens,genslerstrasse_4,hamburg).
lehrer(34569,woehler_annegret,langenharmer_weg_142,schleswig-holstein).
lehrer(34570,baumgartner_klaus,pfefferstrasse_17,hamburg).
lehrer(34571,buder_tina,pfauenweg_89,hamburg).

%veranstaltung(FachId,LehrerId,Fach,Raum,Tag,Start,Ende).
veranstaltung(45678,34567,mathe,23,dienstag,08:15,09:45).
veranstaltung(45679,34570,deutsch,12,freitag,10:15,11:45).
veranstaltung(45680,34569,englisch,9,montag,12:15,13:45).
veranstaltung(45681,34568,geschichte,12,dienstag,12:15,13:45).
veranstaltung(45682,34569,kunst,1,mittwoch,10:15,11:45).
veranstaltung(45683,34571,sport,5,mittwoch,08:15,09:45).
veranstaltung(45684,34567,mathe,23,donnerstag,10:15,11:45).
veranstaltung(45685,34568,deutsch,21,donnerstag,08:15,09:45).

%note(SchuelerId,Fach,Note).
note(12345,mathe,3).
note(12345,geschichte,2).
note(12345,kunst,1).
note(12346,mathe,3).
note(12346,sport,2).
note(12346,kunst,4).
note(12346,deutsch,2).
note(12347,mathe,1).
note(12347,englisch,1).
note(12347,geschichte,3).
note(12348,englisch,4).
note(12348,deutsch,5).
note(12348,kunst,3).
note(12349,sport,5).
note(12349,englisch,6).
note(12350,deutsch,2).
note(12350,mathe,4).
note(12350,geschichte,3).







