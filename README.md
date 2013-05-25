javaProject2TI
==============
Projectoefening mediatheek
Als je project voldoet aan al de basisvereisten dan behaal je 12/20. Als je uitbreidingen maakt kan je nog extra punten verdienen. 
De deadline voor het afwerken van je volledige project is zondag 26 mei 2013 18u. Je levert via het assignment op Toledo je Netbeans-project op.
Basisvereisten:
a.  Maak in Netbeans een webproject met als naam
	klas_familienaam_voornaam_project2013 
dus bvb: 2Ti1_Mertens_Leen_project2013

b.	Implementeer mbv JPA de mapping voor dit klassendiagram. Deadline (opleveren via assignment op Toledo):
dinsdag 30 april 2013 16u35

Kies zelf welke strategy je neemt om de overerving te mappen. 
 
Behoud de namen van de kolommen en tabellen volgens bovenstaand schema. Voeg zelf aan de tabellen gegevens toe om te kunnen testen.






c.	Je maakt een vereenvoudige webapplicatie voor het bijhouden van een examenregeling. Zoek zelf een eenvoudige css die je vlot kan gebruiken en voeg de file toe aan je project. Op de startpagina van de toepassing moeten je naam en klas duidelijk leesbaar zijn.  Je vermeldt daar ook welke onderdelen van het project je afwerkte en welke extra’s je eventueel uitwerkte.

d.	Raadplegen
In je webproject bied je een student enkele mogelijkheden om de bestaande informatie over de examenregeling te raadplegen. 
Allereerst moet een student de mogelijkheid krijgen om een volledige lijst van alle examens te zien. 

Daarnaast moet hij kunnen zoeken op:
a.	alle examens op een bepaalde datum
b.	alle examens van een bepaalde docent
c.	alle gegevens over een examen van een bepaald vak
d.	alle examens in een computerlokaal 
e.	alle examens in een gewoon lokaal
f.	alle examens van een bepaalde soort
Je mag zelf kiezen op welke manier je de informatie toont.

e.	Toevoegen examen
Zorg er nu voor dat een docent een examen kan toevoegen. 
De docent moet zich op een eenvoudige manier naar de toevoegpagina gebracht worden. Daar maakt hij zich bekend (indien hij al gekend is als Docent) of anders geef je hem de mogelijkheid zichzelf toe te voegen in het systeem.



Mogelijke uitbreidingen:

f.	Admin-kant
Programmeer de admin-kant van de toepassing.  De admin heeft een aantal mogelijkheden die een gewone gebruiker niet heeft.
De admin moet in staat zijn de volgende tabellen aan te passen (wijzigen/aanvullen/verwijderen):
•	Docent
•	Lokaal
•	Vak
•	Examen

g.	Zorg ervoor dat examens die momenteel al gedaan zijn, niet meer verschijnen in je lijsten.





Werken met GregorianCalendar:
•	De huidige datum:
GregorianCalendar nu = new GregorianCalendar();

•	11 november 2011:
GregorianCalendar wapenstilstand = new GregorianCalendar(2011, 10, 11);

•	Een string s= "24/11/1983" parsen naar een GregorianCalendar:
     DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
   GregorianCalendar datum = new GregorianCalendar();
   datum.setTime(df.parse(s));

•	Een GregorianCalendar object d als String weergegeven in je jsp-pagina
     DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
   <%=df.format(d)%>

Andere handige voorbeelden vind je bijvoorbeeld hier:
http://www.java2s.com/Code/JavaAPI/java.util/newGregorianCalendar.htm

