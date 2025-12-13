# Apothekennotdiensplan XML-Parser
## Wichtige Informationen

Dieses Programm liest eine XML-Datei bzw. -Schnittstelle aus, um den Notdienstplan der Apotheken anzuzeigen. Dies funktioniert nur für die Schnittstellen von Baden-Württemberg, Bayern, Nordrhein-Westfalen, Schleswig-Holstein und Thüringen - alle anderen Landesapotheker*innenkammern stell(t)en zum Programmierzeitpunkt keinen frei verfügbaren XML-Service zur Verfügung.

## Installation
Laden Sie die .exe-Datei herunter und führen Sie diese aus.

## Nutzungsbedingungen und Informationen

1. Die Bereitstellung der Daten erfolgt durch die API der jeweiligen Landesapotheker*innenkammer.
2. Alle Angaben erfolgen ohne Gewähr.
3. Unter keinen Umständen und unter keiner Rechtstheorie, ob unerlaubte Handlung (einschließlich Fahrlässigkeit), Vertrag oder anderweitig haften die ursprüngliche Entwickler*innen, ein anderer Mitwirkender oder ein Vertreiber des abgedeckten Codes oder ein Lieferant einer dieser Parteien gegenüber einer Person für indirekte, besondere, zufällige oder Folgeschäden jeglicher Art, einschließlich, aber nicht beschränkt auf Schäden durch Verlust von Firmenwert, Arbeitsunterbrechung, Computerausfall oder -fehlfunktion oder alle anderen kommerziellen Schäden oder Verluste, selbst wenn diese Partei über die Möglichkeit solcher Schäden informiert wurde. Diese Haftungsbeschränkung gilt nicht für die Haftung für Todesfälle oder Personenschäden, die auf Fahrlässigkeit der betreffenden Partei zurückzuführen sind, sofern das geltende Recht eine solche Beschränkung verbietet. In einigen Rechtsordnungen ist der Ausschluss oder die Beschränkung von Neben- oder Folgeschäden nicht zulässig, so dass dieser Ausschluss und diese Beschränkung möglicherweise nicht für Sie gelten.
4. Wir übernehmen keine Garantie jeglicher Art, weder ausdrücklich noch stillschweigend, einschließlich, ohne Einschränkung, dass das Programm bzw. der Code frei von Mängeln ist, handelsüblich, geeignet für einen bestimmten Zweck oder nicht das Urheberrecht verletzend. Das gesamte Risiko in Bezug auf die Qualität und Leistung liegt bei Ihnen. Sollte sich das Programm oder der Code in irgendeiner Hinsicht als fehlerhaft erweisen, übernehmen Sie (nicht der ursprüngliche Entwickler oder ein anderer Mitwirkender) die Kosten für die notwendige Wartung, Reparatur oder Korrektur.
5. Gerichtsstandort ist Deutschland und es gilt deutsches Recht. Sofern zulässig wird der Gerichtsstandort auf Ulm festgelegt.
6. Sie sind verpflichtet, die ausgegebenen Daten selbst auf Korrektheit und Vollständigkeit zu prüfen.
7. Diese Software darf nur in Übereinstimmung mit der internationalen Erklärung der Menschenrechte verwendet werden, wie von der Generalversammlung der Vereinten Nationen am 10. Dezember 1948 beschlossen.
8. Die Nutzung der Software oder des Codes ist nur zulässig, wenn diese Nutzungsbedingungen vollumfänglich akzeptiert und eingehalten werden.
9. Abschnitt 7 der Nutzungsbedingungen muss in allen abgeleiteten Werken enthalten sein & die Nutzenden müssen diesem vor der Nutzung explizit zustimmen.
10. Sollten einzelne Teile dieser Lizenz ungültig sein, so bleiben die restlichen Bestandteile unverändert in Kraft.

## Anleitung

1. Führen Sie die heruntergeladene .exe-Datei aus.
2. Generieren Sie den Link zur XML-API der für Sie zuständigen Kammer (siehe nächster Abschnitt).
3. Fügen Sie den generierten Link in das oberste Feld im Programm ein.
4. Wählen Sie die für Sie zuständige Landesapotheker*innenkammer aus der Liste aus.
5. Wählen Sie gegebenenfalls die für Sie bevorzugten Einstellungen aus.
6. Klicken Sie auf den Button "Lade Daten aus dem Internet". Hierzu benötigt das Programm Internetzugriff. Alternativ können Sie die XML-Datei selbst herunterladen und in das selbe Verzeichnis wie die .exe-Datei abspeichern. Bitte beachten Sie, dass die XML-Datei den Namen "Apothekennotdienstplan.xml" (ohne Anführungszeichen) tragen muss, um korrekt erkannt werden zu können.
7. Klicken Sie auf den Button "Daten anzeigen." Diesen Schritt können Sie mit veränderten Einstellungen so oft wiederholen, bis die Ausgabe für Sie passend ist.
8. Klicken Sie auf den Button "Daten speichern". Es öffnet sich ein Fenster und Sie werden nach dem Zielort und dem Dateinamen gefragt. Dort wird die Ausgabe als Text-Datei gespeichert.
9. Prüfen Sie die Ausgabe des Programms mit einem lokalen Notdienstaushang oder mit den Notdienstplänen im Internet auf Korrektheit.

## Hilfe für den XML-API-Link

Stand: 25.01.2025.

- [Baden-Württemberg] Besuchen Sie die Seite https://www.lak-bw.de/service/apotheke/apothekennotdienst/notdienstanzeige-xml-schnittstelle.html und wählen Sie Ihre Wunschdaten. Nach dem Absenden des Formulars erhalten Sie einen Link per E-Mail. Diesen fügen Sie in unserem Programm ein.
- [Bayern] Besuchen Sie die Seite https://www.blak.de/notdienst/notdienst-und-dienstbereitschaft/schnittstelle-xml-html und wählen Sie Ihre Wunschdaten. Nach dem Absenden des Formulars erhalten Sie einen Link per E-Mail. Diesen fügen Sie in unserem Programm ein.
- [Nordrhein-Westfalen] Besuchen Sie die Seite https://www.aknr.de/notdienst/xml und erstellen Sie nach der dortigen Anleitung einen Link. Diesen fügen Sie in unserem Programm ein.
- [Schleswig-Holstein] Besuchen Sie die Seite https://www.aksh-service.de/notdienst_xml.php?id=32 und erstellen Sie nach der dortigen Anleitung einen Link (Sie können auf der rechten Seite auch auf einen anderen Typ von XML-Daten umstellen). Diesen fügen Sie in unserem Programm ein.
- [Thüringen] Besuchen Sie die Seite https://www.lakt.de/xml-schnittstelle und erstellen Sie dort gegebenenfalls einen Account (Gastzugang). Nach der Bestätigung loggen Sie sich auf dieser Seite ein und erstellen Sie einen Link. Diesen fügen Sie in unserem Programm ein.

## Häufig gestellte Fragen und ihre Antworten

### Warum drei Buttons, um die Daten herunterzuladen, anzuzeigen und zu speichern und nicht nur einen?
Wenn Sie die Einstellungen ändern wollen, müssen Sie nicht jedes Mal eine Verbindung ins Internet herstellen. Ebenso muss nicht jedes Mal eine Ausgabedatei erstellt werden, bevor Sie mit dem Ergebnis zufrieden sind. Möglicherweise reicht Ihnen auch bereits die Anzeige auf dem Bildschirm - auch hier muss nicht unbedingt eine Ausgabedatei erstellt werden.

### Warum gibt es dieses Programm überhaupt?
Weil die LAK im Bundesland des/der Entwickler*in keinen ausgedruckten Papierplan mehr zur Verfügung stellt. Nun könnte man jedes Mal zu einer Apotheke zu fahren und dort den aktuellen Aushang betrachten oder auf Onlinequellen zurückgreifen, die oft nur einen bis wenige Tage in die Zukunft reichen (gleichzeitig); Dieses Programm soll hier helfen.
Aktuelle Daten finden Sie beispielsweise auf "Aponet" oder oft auf den Seiten von Apotheken oder der Landesapothekenkammer.

### Wie kann ich das Programm ohne Maus bedienen?
Die Standard-Windows-Funktionen wie Tabulatortaste, um weiterzuschalten und bekannte Kürzel wie STRG + V um Inhalte einzufügen sind in diesem Programm selbstverständlich enthalten. Buttons können außerdem (wenn kein Feld ausgewählt ist, das eine Eingabe unterstützt) auch "gedrückt" werden, wenn man den in der Button-Bezeichnung unterstrichenen Buchstaben drückt. Ist kein solcher sichtbar, bitte die ALT - Taste drücken.

### Die Ausgabe enthält komische Zeichen oder Umlaute und Sonderzeichen werden falsch dargestellt.
Klicken Sie auf "Erweiterte Einstellungen" und stellen Sie die Kodierung auf das korrekte Format Ihrer Quelle ein. Hilft dies nichts, stellen Sie auch die Ausgabekodierung auf denselben Wert wie die Eingabekodierung.

### Wie erfahre ich die korrekte Quellkodierung?
Öffnen Sie die heruntergeladene XML-Datei mit einem Texteditor. Viele Texteditoren zeigen unten rechts (oder links) die Kodierung an, beispielsweise UTF-8.

### Wie sehe ich eine Kurzinformation im Hauptformular?
Drücken Sie oben links auf den Fragezeichenknopf oder drücken Sie die F1 - Taste.

### In welcher Programmiersprache ist das Programm geschrieben?
In Delphi.

### Auf welchen Betriebssystemen läuft die Software?
Die Software funktioniert auf Windows Vista SP 2, Windows 7, Windows 8, Windows 8.1, Windows 10, Windows 11 und mutmaßlich auch auf neueren Systemen. Entwickelt und getestet wurde die Software auf Windows 11, auf Windows Vista SP 2 wurde ein Installationstest durchgeführt.

### Wie kann ich Fehler oder neue Funktionswünsche melden?
https://github.com/koehlesv/ApoNtdXMLParser/issues
Wichtig: Alle Informationen, welche Sie dort teilen, sind öffentlich. Bitte daher keinerlei private bzw. persönliche Daten angeben!
Bitte beachten Sie, dass keine Bearbeitungsgarantie erfolgt und die Umsetzung einige Zeit in Anspruch nehmen kann.

## Automatisierte Ausführung

Auf Windowssystemen gibt es die Aufgabenplanung. Dort kann eine neue Aufgabe angelegt werden. Vergeben Sie einen beliebigen Namen und klicken Sie auf Aktionen und fügen Sie dort eine neue hinzu. Dort stellen Sie die bei "Aktion" den Wert "Programm starten", bei Programm/Skript den Pfad zum Programm (Ggf. auf "Durchsuchen" klicken), in das Feld "Argumente hinzufügen" die Werte "ExecuteDirect" und ggf. weitere (siehe unten, jeweils getrennt durch Leerzeichen) eingeben und schließlich im Feld "Starten in" denselben Pfad wie bei Programm/Skript eintragen, nur ohne das /ApothekenNotdienstplan.exe am Ende. Sowohl der Schrägstrich als auch der Name der Exe-Datei müssen dort entfernt werden.

Gültige Argumente (Werte in Großbuchstaben entsprechend ersetzen, nur der Teil vor dem -- darf angegeben werden):

- ExecuteDirect --Immer angeben, wenn kein Dialog angezeigt werden soll. Nur in diesem Fall werden die anderen Parameter beachtet.
- Print --Optional. Druckt das Ergebnis auf dem Standarddrucker
- "Print:NAME DES DRUCKERS" --Optional. Druckt das Ergebnis auf demjenigen Drucker, der angegeben wurde. Wird kein Drucker dieses Namens gefunden, so wird stattdessen der Standarddrucker benutzt.
- "Save:ZIELDATEIPFAD" --Optional. Speichert in ein beliebiges Zielverzeichnis (dieses muss existieren und Sie benötigen dort Schreibrechte) anstatt in dasselbe Verzeichnis wie die EXE-Datei.
- Log --Optional. Speichert eine Log-Datei ins selbe Verzeichnis wie die EXE-Datei.
- "Log:ZIELVERZEICHNIS" --Optional. Speichert eine Logdatei ins angegebene Zielverzeichnis.
- AppendLog --Optional. Anstatt die Logdatei immer neu zu schreiben wird diese nun um die neuen Daten erweitert.
