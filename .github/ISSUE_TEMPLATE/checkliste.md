---
name: Checkliste
about: Checkliste für eine Website
title: Checkliste für Website
labels: ''
assignees: ''

---

# CMS
[ ] Plugin Password Security ist installiert und konfiguriert  
[ ] Loginadresse ist `/redaktion` statt `/admin`

# Backend
[ ] Pflichtfelder sind gesetzt  
[ ] Alle Asset Field Layouts haben ein Feld für einen Alt-Tags

# Code Qualität
[ ] HTML Validierung ist durchgeführt  
[ ] Das HTML ist semantsich korrekt (nav, header, footer, section, article, aside)

# Frontend
[ ] Logo verlinkt auf Startseite  
[ ] Formularfelder haben richtigen type

# Hosting
[ ] SSL eingerichtet und 301 redirect von non-SSL auf SSL  
[ ] 301 redirect von www auf non-www  
[ ] HSTS ist aktiviert  
[ ] OSCP-Anheftung ist aktiviert  
[ ] PHP memory limit ist `1024M` oder höher

# Seitenqualität
[ ] Jede Seite hat die korrekte Sprache, z. B. `lang="de-CH"`  
[ ] Jede Seite hat eine Meta Description  
[ ] Jede Seite hat einen sinnvollen Titel  
[ ] Jede Seite hat Open Graph Angaben  
[ ] Jede Seite hat Twitter Cards  
[ ] Strukturierte Daten sind angelegt  
[ ] Skripte werden per `defer` geladen  
[ ] Alle Bilder haben Alt-Tags

# Websitequalität
[ ] Canonical Tags zwischen Sprachen sind angelegt  

# Sonstiges
[ ] Favicon ist mit Realfavicon Generator angelegt  
[ ] 404-Seite ist angelegt  
[ ] Content-Security-Policy ist gesetzt und erlaubt nur spezifische Hosts (und keine Inline-Skripts?)

# Go-Live-Vorbereitung
[ ] Sitemap ist eingerichtet  
[ ] Umgebung ist von dev auf production umgestellt (.env Datei)  
[ ] Google Analytics ist eingerichtet

# Migration von alter Website
[ ] Alte Adressen haben neue Seite oder sind redirected

# Online-Status
[ ] Onlinestatus-Check ist eingerichtet  
[ ] Website ist in Google Search Console eingerichtet  
[ ] robtos.txt ist eingerichtet und im Status index  
[ ] Sitemap ist in Search Console angegeben
