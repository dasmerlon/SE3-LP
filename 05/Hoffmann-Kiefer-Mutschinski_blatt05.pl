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
    peano2int(P,N1),    % rekursiver Aufruf
    N is N1 + 1.        % Erhöhen der Integerzahl

/*  
Es handelt sich hierbei um eine induktive Implementierung, da die Rechnung nach 
dem rekursiven Aufruf folgt. Daher erfolgen die Berechnungen erst beim rekursiven 
Aufstieg.
Die Peanozahl muss dabei instanziiert werden. Zwar gibt die Instanziierungsvariante
peano2int(-,-) erfolgreich alle Peanozahlen mit den jeweiligen Integerzahlen aus, 
und auch die Instanziierungsvariante peano2int(-,+) ermittelt erfolgreich zur 
gegebenen Integerzahl die dazugehörige Peanozahl, allerdings kommt es zu einem
Terminierungsproblem, wenn nach der Ausgabe nach weiteren Alternativen gefragt wird.

?- peano2int(X,3).
X = s(s(s(0))) ;
Terminierungsproblem!

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
peano2int2(s(P),N) :- 
    peano2int2(s(P),0,N).   % Wrapper
peano2int2(0,0).            % damit Aufruf peano2int2(0,_) nicht false ausgibt
peano2int2(0,X,X).          % Rekursionsabschluss
peano2int2(s(P),A,N) :-     % Rekursionsschritt
    A1 is A + 1,            % Erhöhen des Zählers
    peano2int2(P,A1,N).     % rekursiver Aufruf

/*  
Es handelt sich hierbei um eine endrekursive Implementierung, da die Rechnung vor 
dem rekursiven Aufruf folgt. Daher erfolgen die Berechnungen schon beim rekursiven 
Abstieg, weshalb diese Implementierung effizienter ist.
Die Peanozahl muss hier ebenfalls aus den gleichen Gründen, wie bei der induktiven
Implementierung, instanziiert werden.
Es gibt einen weiteren Rekursionsabschluss peano2int2(0,0). damit Anfragen, die als
Peanozahl eine 0 haben, also peano2int2(0,0), bzw. peano2int2(0,X) ebenfalls 
funktionieren. Andernfalls würde bei diesen Fällen false ausgegeben werden.

%%%Testanfragen:

%peano2int(+,+): 
%    prüft, ob die angegebene Peanozahl der angegebenen Integerzahl entspricht.
?- peano2int2(s(s(s(0))),3).
true.

%peano2int(+,-):
%    wandelt die angegebene Peanozahl in eine Integerzahl um.
?- peano2int2(s(s(s(0))),X).
X = 3.
?- peano2int2(0,X).
X = 0.

%Negativtest:
?- peano2int2(3,X).
false.
?- peano2int2(s(s(s(1))),X).
false.
*/


%1.b: 

%ist_groesser_gleich(?GPeano,?KPeano)
ist_groesser_gleich(0,0).              % Rekursionsabschluss gleich
ist_groesser_gleich(s(_),0).           % Rekursionsabschluss größer
ist_groesser_gleich(s(A),s(B)) :-      % Rekursionsschritt
    ist_groesser_gleich(A,B).          % rekursiver Aufruf

/*
Wenn man statt den zwei Rekursionsabschlüssen den Rekursionsabschluss 
ist_groesser_gleich(_,0). wählen würde, wären bei Anfragen der Art (+,-) und (-,+)
auch Angaben von Nicht-Peanozahlen möglich. In den Fällen würde als Ergebnis eine 
Variablenbindung mit 0 ausgegeben werden. Mithilfe der zwei Rekursionsabschlüsse
lässt sich dies vermeiden und es wird false ausgegeben.

%%%Testanfragen:

%ist_groesser_gleich(+,+): 
%    prüft, ob die erste Peanozahl >= der zweiten Peanozahl entspricht. 
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
... .                           %...

%Negativtest:
?- ist_groesser_gleich(s(0),s(s(0))).
false.
?- ist_groesser_gleich(1,Y).
false.
*/


%1.c:


%1.d:


%1.e:


%1.f:


%1.g:



%%%Aufgabe 2: 
%2.1:    
    

%2.2: