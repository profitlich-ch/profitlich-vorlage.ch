---
name: Checkliste
about: Checkliste für eine Website
title: Checkliste für Website
labels: ''
assignees: ''

---

# Funktion
[ ] Formulare getestet
[ ] Formularempfänger richtig gesetzt

# Sicherheit
[ ] Projektspezifisches Admin-Passwort ist gesetzt

# CMS
[ ] Update auf neuste Version

# Backend
[ ] Pflichtfelder sind gesetzt  
[ ] Alle Asset Field Layouts haben ein Feld für einen Alt-Tag

# Code Qualität
[ ] HTML Validierung ist durchgeführt  

# Frontend
[ ] Logo verlinkt auf Startseite  

# Redaktion
[] Slugs aller Einträge entsprechen dem Seitennamen
[] Bilder werden angezeigt
[] Asset Index ist bereinigt

# Hosting
[ ] SSL eingerichtet und 301 redirect von non-SSL auf SSL  
[ ] 301 redirect von www auf non-www  
[ ] HSTS ist aktiviert  
[ ] OSCP-Anheftung ist aktiviert  
[ ] PHP memory limit ist `1024M` oder höher

# Semantik
[ ] Das HTML ist semantisch korrekt (nav, header, footer, section, article, aside, …)
[ ] Jede Seite hat die korrekte Sprache, zum Beispiel `lang="de-CH"`  
[ ] Jede Seite hat eine Meta Description  
[ ] Jede Seite hat einen sinnvollen Titel als `h1`  
[ ] Alle Bilder haben Alt-Tags 
[ ] Alle Seiten haben sinvolle und SEO-freundliche URLs  

# Social Media und Strukturierte Daten
[ ] Jede Seite hat Open Graph Angaben  
[ ] Jede Seite hat Twitter Cards  
[ ] Strukturierte Daten sind angelegt  

# SEO
[ ] Canonical Tags zwischen Sprachen sind angelegt  
[ ] Google Page Speed Test ist auf allen ausgeführt, Befunde als issues angelegt  
[ ] Google Page Speed issues sind umgesetzt  
[ ] Sitemap ist eingerichtet  
[ ] robots.txt ist angelegt  

# Sonstiges
[ ] Favicon ist mit Realfavicon Generator angelegt  
[ ] 404-Seite ist angelegt  
[ ] Content-Security-Policy ist umgesetzt  

# Go-Live-Vorbereitung
[ ] Umgebung ist von dev auf production umgestellt (.env Datei)  
[ ] Google Analytics ist eingerichtet

# Migration von alter Website
[ ] Alte Adressen haben neue Seite oder sind redirected

# Online-Status
[ ] Onlinestatus-Check ist eingerichtet  
[ ] Website ist in Google Search Console eingerichtet  
[ ] Sitemap ist in Google Search Console angegeben
