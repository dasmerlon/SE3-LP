/*
SE3-LP WiSe 2020/2021
Übung Gr.04:
    Merle Hoffmann      (7031673)
    Lukas Kiefer        (7260745)
    Björn Mutschinski   (7029008)


Aufgabenblatt 5:
*/


%%%Aufgabe 1:     
%1.a:    

%peano2int(+Peano,?Integer)
peano2int(0,0).         % Rekursionsabschluss
peano2int(s(P),N) :-    % Rekursionsschritt
    peano2int(P,N1),        % rekursiver Aufruf
    N is N1 + 1.            % Erhöhen der Integerzahl

/*  
Es handelt sich hierbei um eine induktive Implementierung, da die Rechnung nach 
dem rekursiven Aufruf folgt. Daher erfolgen die Berechnungen erst beim rekursiven 
Aufstieg.
Die Peanozahl muss dabei instanziiert werden. Zwar gibt die Instanziierungsvariante
peano2int(-,-) erfolgreich alle Peanozahlen mit den jeweiligen Integerzahlen aus, 
und auch die Instanziierungsvariante peano2int(-,+) ermittelt erfolgreich zur 
gegebenen Integerzahl die dazugehörige Peanozahl, allerdings kommt es zu einem
Terminierungsproblem, wenn nach der Ausgabe nach weiteren Alternativen gefragt wird.

%peano2int(-,+): 
?- peano2int(X,3).
X = s(s(s(0))) ;
Terminierungsproblem!

%peano2int(-,-): 
?- peano2int(X,Y).
X = Y, Y = 0 ;
X = s(0), Y = 1 ;
X = s(s(0)), Y = 2 ;
... .


%%%Testanfragen:

%peano2int(+,+): 
%    prüft, ob die angegebene Peanozahl der angegebenen Integerzahl entspricht.
?- peano2int(s(s(s(0))),3).
true.

%peano2int(+,-):
%    wandelt die angegebene Peanozahl in eine Integerzahl um.
?- peano2int(s(s(s(0))),X).
X = 3.

%Spezial-/Grenzfälle:
?- peano2int2(0,0).     
true.
?- peano2int(0,X).    
X = 0.

%Negativtest:
?- peano2int(3,X).
false.
?- peano2int(s(s(s(1))),X).
false.
*/


%%% Alternativ (Augmentation):

%peano2int2(+Peano,?Integer)
peano2int2(Z,N) :- 
    peano2int2(Z,0,N).      % Wrapper
peano2int2(0,X,X).          % Rekursionsabschluss
peano2int2(s(P),A,N) :-     % Rekursionsschritt
    A1 is A + 1,                % Erhöhen des Zählers
    peano2int2(P,A1,N).         % rekursiver Aufruf

/*  
Es handelt sich hierbei um eine endrekursive Implementierung, da die Rechnung vor 
dem rekursiven Aufruf folgt. Daher erfolgen die Berechnungen schon beim rekursiven 
Abstieg, weshalb diese Implementierung effizienter ist.
Die Peanozahl muss hier ebenfalls aus den gleichen Gründen, wie bei der induktiven
Implementierung, instanziiert werden.

%%%Testanfragen:

%peano2int(+,+): 
%    prüft, ob die angegebene Peanozahl der angegebenen Integerzahl entspricht.
?- peano2int2(s(s(s(0))),3).
true.

%peano2int(+,-):
%    wandelt die angegebene Peanozahl in eine Integerzahl um.
?- peano2int2(s(s(s(0))),X).
X = 3.

%Spezial-/Grenzfälle:
?- peano2int2(0,0).     
true.
?- peano2int(0,X).    
X = 0.

%Negativtest:
?- peano2int2(3,X).
false.
?- peano2int2(s(s(s(1))),X).
false.
*/


%1.b: 

%ist_groesser_gleich(?GPeano,?KPeano)
ist_groesser_gleich(0,0).           % Rekursionsabschluss gleich
ist_groesser_gleich(s(_),0).        % Rekursionsabschluss größer
ist_groesser_gleich(s(A),s(B)) :-   % Rekursionsschritt
    ist_groesser_gleich(A,B).           % rekursiver Aufruf

/*
Wenn man statt den zwei Rekursionsabschlüssen den Rekursionsabschluss 
ist_groesser_gleich(_,0). wählen würde, wären bei Anfragen der Art (+,-) und (-,+)
auch Angaben von Nicht-Peanozahlen möglich. In den Fällen würde als Ergebnis eine 
Variablenbindung mit 0 ausgegeben werden. Mithilfe der zwei Rekursionsabschlüsse
lässt sich dies vermeiden und es wird false ausgegeben.

%%%Testanfragen:

%ist_groesser_gleich(+,+): 
%    prüft, ob die erste Peanozahl >= der zweiten Peanozahl ist. 
?- ist_groesser_gleich(s(s(s(0))),s(s(0))).
true.
?- ist_groesser_gleich(s(s(0)),s(s(0))).
true ;
false.

%ist_groesser_gleich(+,-): 
%    ermittelt alle Peanozahlen, die <= der angegebenen Peanozahl ist.
?- ist_groesser_gleich(s(s(0)),Y).
Y = 0 ;
Y = s(0) ;
Y = s(s(0)).

%ist_groesser_gleich(-,+): 
%    ermittelt alle Peanozahlen, die >= der angegebenen Peanozahl ist.
?- ist_groesser_gleich(X,s(s(0))).
X = s(s(0)) ;
X = s(s(s(_45362))).    % _Zahl ist die interne Repräsentation einer Variable

%ist_groesser_gleich(-,-): 
%    gibt zu jeder Peanozahl alle Peanozahlen an, die größer oder gleich sind.
?- ist_groesser_gleich(X,Y).
X = Y, Y = 0 ;                  % 0 gleich 0
X = s(_39540), Y = 0 ;          % s(_) größer 0
X = Y, Y = s(0) ;               % s(0) gleich s(0)
X = s(s(_41358)), Y = s(0) ;    % s(s(_)) größer s(0)
X = Y, Y = s(s(0)) ;            % s(s(0)) gleich s(s(0))
... .                           % ...

%Negativtest:
?- ist_groesser_gleich(s(0),s(s(0))).
false.
?- ist_groesser_gleich(1,Y).
false.
*/


%1.c:

%ist_kleiner_gleich(?KPeano,?GPeano)
ist_kleiner_gleich(0,0).            % Rekursionsabschluss gleich
ist_kleiner_gleich(0,s(_)).         % Rekursionsabschluss kleiner
ist_kleiner_gleich(s(A),s(B)) :-    % Rekursionsschritt
    ist_kleiner_gleich(A,B).            % rekursiver Aufruf

/*  
Der Aufbau der Prädikate ist_groesser_gleich(Peano1,Peano2) und 
ist_kleiner_gleich(Peano1,Peano2) sind gleich, außer dass die Argumente des 
zweiten Rekursionsabschlusses vertauscht sind.
Mit beiden Prädikaten kann man mit allen Instanziierungsvarianten die selben
Ergebnisse erhalten. Der einzige Unterschied ist, dass die Argumente vertauscht sind.
ist_groesser_gleich(A,B) entspricht ist_kleiner_gleich(B,A).

%%%Testanfragen:

%ist_groesser_gleich(+,+): 
%    prüft, ob die erste Peanozahl <= der zweiten Peanozahl ist. 
?- ist_kleiner_gleich(s(0),s(s(0))).
true.
?- ist_kleiner_gleich(s(0),s(0)).
true ;
false.

%ist_groesser_gleich(+,-): 
%    ermittelt alle Peanozahlen, die >= der angegebenen Peanozahl ist.
?- ist_kleiner_gleich(s(s(0)),Y).
Y = s(s(0)) ;
Y = s(s(s(_16704))).

%ist_groesser_gleich(-,+): 
%    ermittelt alle Peanozahlen, die <= der angegebenen Peanozahl ist.
?- ist_kleiner_gleich(X,s(s(0))).
X = 0 ;
X = s(0) ;
X = s(s(0)).

%ist_groesser_gleich(-,-): 
%    gibt zu jeder Peanozahl alle Peanozahlen an, die kleiner oder gleich sind.
?- ist_kleiner_gleich(X,Y).
X = Y, Y = 0 ;                  % 0 gleich 0
X = 0, Y = s(_20554) ;          % 0 kleiner s(_)
X = Y, Y = s(0) ;               % s(0) gleich s(0)
X = s(0), Y = s(s(_22372)) ;    % s(_) kleiner s(s(_))
X = Y, Y = s(s(0)) ;            % s(s(0)) gleich s(s(0))
... .                           % ...

%Negativtest:
?- ist_kleiner_gleich(s(s(0)),s(0)).
false.
?- ist_kleiner_gleich(1,Y).
false.
*/


%1.d:

%halbieren(+Zahl,?HalbeZahl,?Rest)
halbieren(Z,H,R) :- 
    halbieren(Z,H,R,0).     % Wrapper
halbieren(0,H,R,A) :-       % Rekursionsabschluss & Rechnung
    R is A mod 2,               % Rest = Zahl modulo 2
    X is A - R,                 % X = Zahl - Rest
    H is X / 2.                 % HalbeZahl = X / 2
halbieren(s(Z),H,R,A) :-    % Rekursionsschritt
    A1 is A + 1,                % Erhöhen des Zählers
    halbieren(Z,H,R,A1).        % rekursiver Aufruf

/*
Das Prädikat halbieren(Zahl,HalbeZahl,Rest) ermittelt für HalbeZahl und Rest eine
Integerzahl. Der Typ der Ausgabe wurde in der Aufgabe nicht festgelegt.
Wenn man stattdessen nur Peanozahlen als Ergebnis bekommen möchte, kann man 
das beispielsweise mithilfe des int2peano-Prädikats aus der Vorlesung lösen
oder ganz ohne Integerzahlen (siehe Alternative weiter unten).

Das erste Argument, die Peanozahl, muss instanziiert werden, da es wie bei Aufgabe 
1.a zu Terminierungsproblemen kommt, wenn man nach weiteren Alternativen fragt, die 
nicht existieren. Dies tritt bei den Instanziierungsvarianten (-,+,+) und (-,+,-) 
ein. Die Instanziierungsvariante (-,-,+) funktioniert zwar, aber nur wenn die 
gegebene Restzahl eine 1 oder 0 ist, da es keine andere Restzahl bei der Division 
mit 2 geben kann. Die Instanziierung (-,-,-) würde einwandfrei funktionieren.
Mit dem Prädikat kann man keine Verdopplung einer Peanozahl, sondern höchstens eine 
Verdopplung von einer Integer- zu einer Peanozahl mithilfe der Instanziierung (-,+,+)
ermitteln. Da aber das erste Argument instanziiert sein muss, kann man generell 
keine Verdopplung ermitteln.

%halbieren(-,+,+): 
?- halbieren(Z,3,1).
Z = s(s(s(s(s(s(s(0))))))) ;
Terminierungsproblem!

%halbieren(-,+,-): 
?- halbieren(Z,3,R).
Z = s(s(s(s(s(s(0)))))), R = 0 ;
Z = s(s(s(s(s(s(s(0))))))), R = 1 ;
Terminierungsproblem!

%halbieren(-,-,+):      Der Rest kann nur 0 oder 1 sein.
?- halbieren(Z,H,1).
Z = s(0), H = 0 ;
Z = s(s(s(0))), H = 1 ;
Z = s(s(s(s(s(0))))), H = 2 ;
... .

%halbieren(-,-,-): 
?- halbieren(Z,H,R).
Z = H, H = R, R = 0 ;
Z = s(0), H = 0, R = 1 ;
Z = s(s(0)), H = 1, R = 0 ;
Z = s(s(s(0))), H = R, R = 1 ;
... .


%%%Testanfragen:

%halbieren(+,+,+): 
%    prüft, ob die Peanozahl, der Quotient und der Rest übereinstimmen.
?- halbieren(s(s(s(0))),1,1).
true.

%halbieren(+,+,-): 
%    ermittelt den Rest einer gegebenen Peanozahl und gegebenen Quotienten.
?- halbieren(s(s(s(s(s(0))))),2,R).
R = 1.

%halbieren(+,-,+): 
%    ermittelt den Quotienten einer gegebenen Peanozahl und gegebenen Rest.
?- halbieren(s(s(s(s(s(0))))),H,1).
H = 2.

%halbieren(+,-,-): 
%    ermittelt den Quotienten und den Rest einer Peanozahl als Integerzahl.
?- halbieren(s(s(s(s(s(0))))),H,R).
H = 2,
R = 1.

%Spezial-/Grenzfälle:
?- halbieren(0,H,R).
H = R, R = 0.
?- halbieren(s(0),H,R).
H = 0, R = 1.
?- halbieren(s(s(0)),H,R).
H = 1, R = 0.

%Negativtest:
?- halbieren(s(s(s(0))),2,1).
false.
?- halbieren(2,H,R).
false.
*/


%%% Alternativ: Als Ergebnis erhält man wieder Peanozahlen
% (ohne Verwendung von Integerzahlen, da laut 1.a die Prädikate 
%  peano2int und int2peano nicht erlaubt sind)

%Hilfsprädiakte even(P) und odd(P) aus der Vorlesung S.166:
%even(+Peano)
even(0).
even(s(P)) :- odd(P).

%odd(+Peano)
odd(s(P)) :- even(P).


%halbieren2(+Zahl,?HalbeZahl,?Rest)
halbieren2(Z,H,0) :-            % Wrapper für gerade Peanozahlen
    even(Z),                        % prüfen, ob gerade
    halbieren2(Z,H,0,0).            % Rest=0
halbieren2(s(Z),H,s(0)) :-         % Wrapper für ungerade Peanozahlen
    odd(s(Z)),                      % prüfen, ob ungerade
    halbieren2(Z,H,s(0),0).         % Rest=1, Z=Z-1
halbieren2(X,X,0,X).            % Rekursionsabschluss gerade
halbieren2(X,X,s(0),X).         % Rekursionsabschluss ungerade
halbieren2(s(Z),H,R,A) :-       % Rekursionsschritt
    halbieren2(Z,H,R,s(A)).         % rekursiver Aufruf

/*
Das Prädikat halbieren2(Zahl,HalbeZahl,Rest) ermittelt für HalbeZahl und Rest eine
Peanozahl. Das Prädikat prüft zu beginn, ob die Peanozahl gerade oder ungerade ist
und legt somit direkt am Anfang den Rest fest, da x mod 2 bei ungeraden Zahlen immer
1 und bei geraden Zahlen 0 ist. Im Falle einer ungeraden Peanozahl, wird diese um 1
abgezogen, damit diese gerade und daher durch 2 teilbar wird. Im Rekursionsschritt
wird von der Peanozahl rekursiv 1 abgezogen und auf einen Zähler 1 addiert, bis
die Peanozahl und der Zähler gleich sind, was bedeutet, dass die Hälfte der Peanozahl
erreicht ist.

Das erste Argument muss aus den gleichen Gründen wie in der 1. Variante instanziiert 
werden. Da keine Terminierungssicherheit garantiert werden kann, kann man mit diesem
Prädikat auch keine Peanozahl verdoppeln, obwohl dies in der Theorie bei der ersten
Variablenbindung funktioniert. cut/0 wäre keine Lösung, da dann beispielsweise 
die Instanziierung (-,-,-) nur noch das erste Ergebnis ausgeben würde und nicht
alle Möglichen.

%%%Testanfragen:

%halbieren(+,+,+): 
%    prüft, ob die Peanozahl, der Quotient und der Rest übereinstimmen.
?- halbieren2(s(s(s(0))),s(0),s(0)).
true ;
false.

%halbieren(+,+,-): 
%    ermittelt den Rest einer gegebenen Peanozahl und gegebenen Quotienten.
?- halbieren2(s(s(s(s(s(0))))),s(s(0)),R).
R = s(0) ;
false.

%halbieren(+,-,+): 
%    ermittelt den Quotienten einer gegebenen Peanozahl und gegebenen Rest.
?- halbieren2(s(s(s(s(s(0))))),H,s(0)).
H = s(s(0)) ;
false.

%halbieren(+,-,-): 
%    ermittelt den Quotienten und den Rest einer Peanozahl als Integerzahl.
?- halbieren2(s(s(s(s(s(0))))),H,R).
H = s(s(0)), R = s(0) ;
false.

%Spezial-/Grenzfälle:
?- halbieren2(0,H,R).
H = R, R = 0.
?- halbieren2(s(0),H,R).
H = 0, R = s(0).
?- halbieren2(s(s(0)),H,R).
H = s(0), R = 0 ;
false.

%Negativtest:
?- halbieren2(s(s(s(0))),s(s(0)),s(0)).
false.
?- halbieren2(2,H,R).
false.
*/


%1.e:       

%verdoppelt(+Peano1,?Peano2)
verdoppelt(P1,P2) :-            
    verdoppelt(P1,P2,P1).       % Wrapper
verdoppelt(0,X,X).              % Rekursionsabschluss
verdoppelt(s(P1),s(P2),A) :-    % Rekursionsschritt
    verdoppelt(P1,s(P2),s(A)).      % rekursiver Aufruf

/*
Das Prädikat verdoppelt(Peano1,Peano2) prüft für zwei Peanozahlen, ob Peano2 doppelt
so groß ist, wie Peano1, indem es Peano1 kopiert und dann rekursiv eine Zahl von 
Peano1 abzieht und eine Zahl der Kopie hinzufügt, bis Peano1 zu 0 wird. Dann besteht 
die Kopie aus 2*Peano1 und ist somit die verdoppelte Peanozahl. Wenn diese mit der 
unveränderten Peano2 übereinstimmt, ist Peano2 ebenfalls die Verdopplung von Peano1.

Das erste Argument, Peano1, muss instanziiert werden, da es sonst bei der 
Instanziierungsvariante (-,+) zu Terminierungsproblemen kommen kann. Bei der 
Instanziierung einer geraden Peanozahl als zweites Argument, gibt das Prädikat zwar
das richtige Ergebnis, also die halbierte Peanozahl, aus, aber bei der Anfrage nach 
weiteren Alternativen kommt es dann zu einem Terminierungsproblem. Wenn man direkt
nach der halben Peanozahl einer ungeraden Peanozahl fragt, kommt es stattdessen
direkt zu einem Terminierungsproblem, da es nur natürliche und keine rationalen
Peanozahlen gibt. Die Instanziierung (-,-) würde theoretisch funktionieren und würde
alle Peanozahlen mit ihrer Verdopplung ausgeben.
Folglich lässt sich das Prädikat theoretisch(!) zum Halbieren von Peanozahlen 
verwenden, da aber keine Terminierungssicherheit garantiert werden kann, darf man es
dafür nicht nutzen, da Peano1 (die halbe Peanozahl) immer instanziiert sein muss.

%verdoppelt(-,+): 
?- verdoppelt(X,s(s(s(s(0))))).
X = s(s(0)) ;
Terminierungsproblem!
?- verdoppelt(X,s(s(s(0)))).
Terminierungsproblem!

%verdoppelt(-,-): 
?- verdoppelt(X,Y).
X = Y, Y = 0 ;
X = s(0), Y = s(s(0)) ;
X = s(s(0)), Y = s(s(s(s(0)))) ;
X = s(s(s(0))), Y = s(s(s(s(s(s(0)))))) ;
... .


%%%Testanfragen:

%verdoppelt(+,+):
%    prüft, ob die zweite Peanozahl doppelt so groß ist, wie die erste.
?- verdoppelt(s(s(0)),s(s(s(s(0))))).
true.

%verdoppelt(+,-): 
%    ermittelt zu einer gegebenen Peanozahl die verdoppelte Peanozahl.
?- verdoppelt(s(s(0)),Y).
Y = s(s(s(s(0)))).

%Sonder-/Grenzfälle:
?- verdoppelt(0,Y).
Y = 0.

%Negativtest:
?- verdoppelt(s(s(0)),s(s(s(0)))).
false.
*/


%1.f:

%max(?Peano1,?Peano2,?PeanoMax)
max(X,0,X).                     % Rekursionsabschluss für "Peano1 ist größer"
max(0,X,X).                     % Rekursionsabschluss für "Peano2 ist größer"
max(s(P1),s(P2),s(PM)) :-       % Rekursionsschritt
    max(P1,P2,PM).                  % rekursiver Aufruf

/*
Das Prädikat max(Peano1,Peano2,PeanoMax) ermittelt für zwei Peanozahlen das Maximum,
indem rekursiv immer eine Zahl abgezogen wird.Die erste Zahl, die zur 0 wird, ist
die kleinere, weshalb die andere Zahl gleich PeanoMax gilt. Bei Gleichheit erhält 
man als Ergebnis zweimal die gleiche Variablenbindung, da beide Rekursionsabschlüsse
erfolgreich sind, indem beide Peanozahlen gleichzeitig bei 0 enden.

%%%Testanfragen:

%max(+,+,+):
%    prüft, ob die maximale Peanozahl wirklich das Maximum zweier Peanozahlen ist.
?- max(s(s(0)),s(0),s(s(0))).
true ;
false.
?- max(s(0),s(s(0)),s(s(0))).
true.

%max(+,+,-):
%    ermittelt das Maximum zweier Peanozahlen. 
?- max(s(0),s(s(0)),Max).
Max = s(s(0)).

%max(+,-,+):
%    ermittelt die andere Zahl bei gegebenen Maximum und einer Zahl.
%    Gleich zu (-,+,+).
?- max(s(0),P2,s(s(0))).
P2 = s(s(0)).

%max(+,-,-):
%    ermittelt bei gegebener Zahl, alle Kombinationen einer weiteren Zahl und 
%    dessen gemeinsames Maximum. Gleich zu (-,+,-).
?- max(s(s(0)),P2,Max).
P2 = 0, Max = s(s(0)) ;
P2 = s(0), Max = s(s(0)) ;
P2 = Max, Max = s(s(0)) ;
P2 = Max, Max = s(s(_14398)).

%max(-,+,+):
%    ermittelt die andere Zahl bei gegebenen Maximum und einer Zahl.
%    Gleich zu (+,-,+).
?- max(P1,0,s(0)).
P1 = s(0) ;
false.

%max(-,+,-):
%    ermittelt bei gegebener Zahl, alle Kombinationen einer weiteren Zahl und 
%    dessen gemeinsames Maximum. Gleich zu (+,-,-).
?- max(P1,s(0),Max).
P1 = 0, Max = s(0) ;
P1 = Max, Max = s(_1976) ;
P1 = Max, Max = s(0) ;
false.

%max(-,-,+):
%    ermittelt bei gegebenem Maximum alle möglichen Kombinationen zweier Zahlen.
?- max(P1,P2,s(0)).
P1 = s(0), P2 = 0 ;
P1 = 0, P2 = s(0) ;
P1 = P2, P2 = s(0) ;
P1 = P2, P2 = s(0) ;
false.

%max(-,-,-):
%    ermittelt alle Kombinationen von zwei Zahlen und dessen Maximum.
?- max(P1,P2,Max).
P1 = Max, P2 = 0 ;
P1 = 0, P2 = Max ;
P1 = Max, Max = s(_18190), P2 = s(0) ;
P1 = s(0), P2 = Max, Max = s(_18194) ;
... .

%Sonder-/Grenzfälle:
?- max(s(s(0)),s(s(0)),Max).
Max = s(s(0)) ;
Max = s(s(0)).
?- max(P1,s(0),s(0)).
P1 = 0 ;
P1 = s(0) ;
P1 = s(0) ;
false.

%Negativtest:
?- max(P1,s(s(0)),s(0)).
false.
?- max(s(s(0)),1,Max).
false.
*/


%1.g:

%Hilfsprädiakt add(P1,P2,S) aus der Vorlesung S.168:
%add(?Peano1,?Peano2,?Summe)
add(0,X,X).                 % Rekursionsabschluss
add(s(P1),P2,s(S)) :-       % Rekursionsschritt
    add(P1,P2,S).               % rekursiver Aufruf

%peano_rbm(+Peano1,+Peano2,?Resultat)
peano_rbm(P1,s(0),P1).              % Rekursionsabschluss
peano_rbm(P1,s(P2),R) :-            % Rekursionsschritt für ungerade Peanozahl
    s(P2) @> s(0),                      % prüfe, ob Peano2 größer 1
    odd(s(P2)),                         % prüfe, ob Peano2 ungerade
    peano_rbm(P1,P2,R1),                % rekursiver Aufruf mit Peano2-1 und
    add(R1,P1,R).                       % Resultat=Resultat1+Peano1
peano_rbm(P1,P2,R) :-               % Rekursionsschritt für gerade Peanozahl
    P2 @> s(0),                         % prüfe, ob Peano2 größer 1
    even(P2),                           % prüfe, ob Peano2 gerade
    verdoppelt(P1,P11),                 % P11=verdoppel Peano1
    halbieren2(P2,P21,_),               % P21=halbiere Peano2
    peano_rbm(P11,P21,R).               % rekursiver Aufruf mit P11 und P21

/*
Das Prädikat peano_rbom(P1,P2,R) ist im Aufbau und vom Ablauf analog zu dem Prädikat
rbm(F1,F2,P) aus der Vorlesung S.212.

Das Prädikat lässt sich nicht für die Division verwenden, da beide Peanozahlen
gegeben sein müssen und aus dennen immer das Produkt der Bauernmultiplikation 
ermittelt wird. Das erste Argument muss immer instanziiert sein, da es bei der 
Instanziierung (-,+,+) beispielsweise bei der Abfrage nach Alternativen zur 
Terminierungsproblemen kommt. Das zweite Argument muss instanziiert sein, da für
das zweite Argument immer nur die Variablenbindung mit s(0) ausgegeben wird, da dies
in dem Rekursionsabschluss festgelegt ist.

%peano_rbm(+,-,+):      
?- peano_rbm(s(s(0)),P2,s(s(s(s(s(s(0))))))).
false.      % aufgrund des Rekursionsabschlusses (P2 wäre eigentlich s(s(s(0))))

%peano_rbm(+,-,-):
?- peano_rbm(s(s(0)),P2,R).
P2 = s(0),
R = s(s(0)) ;
false.      % es gäbe eigentlich mehr Lösungen

%peano_rbm(-,+,+):
?- peano_rbm(P1,s(s(s(0))),s(s(s(s(s(s(0))))))).
P1 = s(s(0)) ;
Terminierungsproblem!

%peano_rbm(-,+,-):
?- peano_rbm(P1,s(s(s(0))),R).
P1 = R, R = 0 ;
P1 = s(0), R = s(s(s(0))) ;
P1 = s(s(0)), R = s(s(s(s(s(s(0)))))) ;
... .

%peano_rbm(-,-,+):
?- peano_rbm(P1,P2,s(s(s(s(s(s(0))))))).
P1 = s(s(s(s(s(s(0)))))),
P2 = s(0) ;
false.      % es gäbe eigentlich mehr Lösungen

%peano_rbm(-,-,-):
?- peano_rbm(P1,P2,R).
P1 = R,
P2 = s(0) ;
false.      % es gäbe eigentlich mehr Lösungen


%%%Testanfragen:

%peano_rbm(+,+,+):
%    prüft, ob das gegebene Peanoprodukt das Produkt der zwei Peanozahlen ist.
%    Aufgrund des Rekursionsabschlusses darf das zweite Argument keine 0 sein.
?- peano_rbm(s(s(0)),s(s(s(0))),s(s(s(s(s(s(0))))))).
true ;
false.
?- peano_rbm(0,s(0),0).
true ;
false.
?- peano_rbm(s(0),s(0),s(0)).
true ;
false.

%peano_rbm(+,+,-):
%    ermittelt das Produkt zweier Peanozahlen mithilfe der russischen
%    Bauernmultiplikation.
%    Aufgrund des Rekursionsabschlusses darf das zweite Argument keine 0 sein.
?- peano_rbm(s(s(0)),s(s(s(0))),R).
R = s(s(s(s(s(s(0)))))) ;
false.

%Sonder-/Grenzfälle:
?- peano_rbm(s(0),s(0),R).
R = s(0) ;
false.
?- peano_rbm(0,s(0),R).
R = 0 ;
false.

%Negativtest:
?- peano_rbm(3,s(s(0)),R).
false.
?- peano_rbm(s(0),0,R).
false.                      % aufgrund des Rekursionsabschlusses false
*/



%%%Aufgabe 2:   
%2.1:           medien2.pl ohne 2020-Einträge laden!

%Hilfsprädiakt produkte_in_kategorie(KID,PID) von Blatt 03, Aufgabe 3.3 
% zur Suche aller Produkte einer Kategorie und ihrer Unterkategorien
%produkte_in_kategorie(?KID,?PID)
produkte_in_kategorie(KID,PID) :-
    produkt(PID,KID,_,_,_,_,_).
produkte_in_kategorie(KID,PID) :-
    kategorie(IdSub,_,KID),
    produkte_in_kategorie(IdSub,PID).

%Hilfsprädiakt zur Berechnung des Durchschnittpreises
durchschnitt([],Durchschnitt,Summe,Anzahl):-            % Rekursionsabschluss
    Durchschnitt is Summe / Anzahl.                         % Durchschnittsberechnung
durchschnitt(Preisliste,Durchschnitt,Summe,Anzahl) :-   % Rekursionsschritt
    Preisliste=[Preis|Restliste],                           % [Kopf|Rest]
    Summe2 is Summe + Preis,                                % Zwischensumme
    durchschnitt(Restliste,Durchschnitt,Summe2,Anzahl).     % rekursiver Aufruf


%durchschnittlicher_preis(+Jahr,+KID,?Durchschnitt)
durchschnittlicher_preis(Jahr,KID,Durchschnitt) :-
    findall(Preis,                                      % findet alle Preise aller
            (produkte_in_kategorie(KID,ID),             % gefragten Produkte
                verkauft(ID,Jahr,Preis,_)),
            Preisliste),
    length(Preisliste,Anzahl),                          % Anzahl der Preise
    Anzahl>0,                                           % prüft, ob Anzahl>0
    durchschnitt(Preisliste,Durchschnitt,0,Anzahl).     % Aufruf des Hilfsprädiakts

/*
Das Prädikat durchschnittlicher_preis(Jahr,KID,Durchschnitt) berechnet zu einem 
gegebenen Jahr den durchschnittlichen Preis aller Produkte einer Kategorie und
ihrer Unterkategorien. Dazu werden alle Preise aller Produkte der Kategorie und 
Unterkategorien in einer Liste zusammengetragen. Anzahl>0 prüft dabei, dass die
Liste nicht leer ist, damit später im Prädikat durchschnitt() nicht durch 0 geteilt
wird. Das Prädikat durchschnitt() entnimmt rekursiv den Kopf der Liste und rechnet
so alle Preise zusammen. Wenn die Liste leer ist, wird der Durchschnitt berechnet, 
indem die Summe mit der Anzahl der Produkte dividiert wird.

Das Jahr und die Kategorie müssen bei durchschnittlicher_preis(Jahr,KID,Durchschnitt) 
immer instanziiert sein, da diese Argumente bei dem Prädikatsaufruf 
durchschnitt(PL,D,S,A) nicht mit übergeben werden und man danach
nicht mehr auf sie zugreifen, bzw. sie ermitteln kann.

%%%Testanfragen:

%max(+,+,+):
%    prüft, ob das Verkaufsjahr und die Kategorie mit dem angegebenen 
%    Durchschnittspreis übereinstimmen.
?- durchschnittlicher_preis(2018,7,18.5).
true ;
false.

%max(+,+,-):
%    ermittelt den Durchschnittspreis aller Produkte einer Kategorie in einem Jahr.
?- durchschnittlicher_preis(2018,1,Durchschnittspreis).
Durchschnittspreis = 20 ;
false.

%Sonder-/Grenzfälle:
?- durchschnittlicher_preis(2011,KID,Durchschnittspreis).
Durchschnittspreis = 39 ;       %nur ein Eintrag für 2011
false.

%Negativtest:   
?- durchschnittlicher_preis(2015,4,Durchschnittspreis).
false.      % keine Verkaufseinträge für die angegebenen Daten:
*/


%2.2:       Entspricht nicht ganz der Aufgabenstellung :(

%teuerstes_produkt(+Jahr,+KID,?PID)
teuerstes_produkt(Jahr,KID,PID) :-
    findall([Preis,ID],                                 % findet alle Preise und IDs
            (produkte_in_kategorie(KID,ID),             % aller gefragten Produkte
                verkauft(ID,Jahr,Preis,_)),
            Preisliste),
    teuer(Preisliste,[0],PID).     

teuer([],TeuerstesProdukt,PID):-                       % Rekursionsabschluss
    TeuerstesProdukt=[_,PID].                               % entnehme die ID
teuer(Preisliste,TeuerstesProdukt,PID):-               % Rekursionsschritt, wenn Kopf teurer/gleich
    Preisliste=[Produkt|Restliste],                      
    Produkt=[Preis|_],
    TeuerstesProdukt=[Preis2|_],
    Preis>=Preis2, teuer(Restliste,Produkt,PID).     
teuer(Preisliste,TeuerstesProdukt,PID):-               % Rekursionsschritt, wenn Kopf günstiger/gleich
    Preisliste=[Produkt|Restliste],
    Produkt=[Preis|_],
    TeuerstesProdukt=[Preis2|_],
    Preis=<Preis2, teuer(Restliste,TeuerstesProdukt,PID).

/*
Das Prädikat ermittelt das teuerste Produkt einer gegebenen Kategorie und Jahr.

%%%Testanfragen:

%teuerstes_produkt(+,+,+)
?- teuerstes_produkt(2016,0,12349).
true ;
false.

%teuerstes_produkt(+,+,-)
?- teuerstes_produkt(2018,0,X).
X = 12345 ;
false.

%Sonder-/Grenzfälle:
?- teuerstes_produkt(2016,0,X).     % zwei teuerste Produkte
X = 12349 ;
X = 12347 ;
false.
?- teuerstes_produkt(2011,0,X).     % nur ein Eintrag
X = 12347 ;
false.

%Negativtest:  
?- teuerstes_produkt(2010,0,X).     % kein Eintrag
false.
*/



/*
Weitere Denkanstöße und Probeprädikate (unvollständig und nicht korrekt):


%für EINE gegebene Kategorie und Jahr-> teuerstes Produkt
teuerstes_produkt2(Jahr,ID,KID) :-
    verkauft(ID,Jahr,Preis,_), 
    \+ (verkauft(ID2,Jahr,Preis2,_),
        produkt(ID2,KID,_,_,_,_,_),
        Preis<Preis2),
    produkt(ID,KID,_,_,_,_,_).

teuerstes_produkt3(Jahr,ID):-
    teuerstes_produkt(Jahr,ID,21).
teuerstes_produkt3(_,_,0).
teuerstes_produkt3(Jahr,ID,KID) :-
    verkauft(ID,Jahr,Preis,_), 
    \+ (verkauft(ID2,Jahr,Preis2,_),
        produkt(ID2,KID,_,_,_,_,_),
        Preis<Preis2),
    produkt(ID,KID,_,_,_,_,_),
    IdSub is KID-1,
    teuerstes_produkt3(Jahr,ID,IdSub).

teuerstes_produkt4(Jahr,ID,KName) :-
    kategorie(KID,KName,_),
    produkt(ID,KID,_,_,_,_,_),
    verkauft(ID,Jahr,Preis1,_),
    \+ (verkauft(_,Jahr,Preis2,_), Preis1>Preis2).
*/