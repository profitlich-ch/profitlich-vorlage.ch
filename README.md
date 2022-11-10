# Projekt aufsetzen

1. Github repository anlegen `domain.tld`
2. Git repository clonen mit `git clone` [HTTPS URL]
3. [Craft CMS installieren](https://craftcms.com/docs/4.x/installation.html) 
4. .vscode. gulpfile.js, .gitignore
5. .ddev/config.yaml kopieren und name ändern mit `domain.tld`
6. `colima start`
7. `ddev start`
8. `ddev status`, um URL und Verbindung zu DB auszulesen
9.  `ddev ssh`
10.  `php craft setup`
11. Daten aus Schritt ddev status verwenden. Site URL ist die ddev web URL.
12. Site language üblicherweise de-CH
13. Admin login `xxx-admin` mit xxx = Kundenkürzel
14. Craft Pro aktivieren (Testversion)
15. Plugins installieren: Password Policy


# Craft Synchronisierung

## Voraussetzungen
- Die .env Datei ist _nicht_ im Git
- ddev/config.yaml ist im Git
- Aktuelle Version von rsync: `brew install rsync`

## Schritte

### Quellsystem
- (Werkzeuge › Projektkonfiguration › YAML-Änderungen anwenden)
- `ddev ssh`
- mysql dump in Hauptverzeichnis: `mysqldump db > dump.sql`
- `exit`
- git push

### ddev Zielsystem 
- Git pull
- `ddev ssh`
- Datenbank überschreiben: `mysql db < dump.sql`
- Update Craft dependencies `composer install --no-interaction`
- Projektkonfiguration aktualisieren: `php craft up`

### Server Zielsystem 
- Git pull 
– `ddev ssh`
- Datenbank überschreiben (Metanet): `mysql -h 127.0.0.1 -u dev_profitlich_craft -p dev_profitlich_craft < dump.sql`
- Update Craft dependencies `composer install --no-interaction`
- Projektkonfiguration aktualisieren: `php craft up`

#### Erläuterung des mysql Befehls
**mysql | -h 127.0.0.1 | -u dev_profitlich_craft | -p | dev_profitlich_craft | < | dump.sql**
Rufe mySQL auf  
Verbinde mit Host  
Benutze ein Passwort  
Datenbankname  
überschreibe von  
Datei, mit der überschrieben werden soll


# Git Vorgehen
- Jeder entwickelt in einem eigenen branch dev-name
- dev-name pushen
- pull request von dev-name nach dev
- Konflikt: dateModified config/project/config.yaml auf das neuere Datum (höhere Zahl)
- Konflikt: fields, entries etc. absprechen, was bleibt und gelöscht wird
- Merge
- `checkout dev`, `git pull dev`
- `checkout dev-name`, `git pull origin dev` (origin dev, weil sonst dev-name gepullt wird)
- Weiterarbeiten an dev-name


# Assets Synchronisierung

    rsync -a -e 'ssh -p 2121' profitlich-ssh@profitlich.ch:/staging.profitlich.ch/web/assets/ web/assets/


# Lese- und Recherchestoff

Branches  
https://craftcms.stackexchange.com/questions/39133/multiple-developers-working-on-the-same-site-project-config-issues

Deploy your site with git  
https://gist.github.com/nichtich/5290675

Git workflow  
https://gist.github.com/Nilpo/8ed5e44be00d6cf21f22

Git repo auf dem Server mit --bare initialisieren, so dass keine Arbeitsdateien dort gespeichert werden.

Risiken eines Git auf derm Server  
https://www.mittwald.de/blog/webentwicklung-design/git-repositories-auf-dem-server-keine-gute-idee  
https://www.heise.de/ct/artikel/Massive-Sicherheitsprobleme-durch-offene-Git-Repositorys-4795181.html

Gefahr: Passwörter im Git
Lösung: Git nicht im Web Root

Node dev/production
https://nodejs.dev/en/learn/nodejs-the-difference-between-development-and-production/

npm install ohne devDependencies
npm install --omit=dev
https://stackoverflow.com/questions/9268259/how-do-you-prevent-install-of-devdependencies-npm-modules-for-node-js-package

https://mattgrayisok.com/craft-cms-deployment-methods


# Automatisierung

https://craftcms.stackexchange.com/questions/1415/is-there-an-easy-way-to-download-the-assets-directory-to-a-local-install

https://github.com/nystudio107/craft-scripts


# Planung der Projektvorlage
- ddev braucht nicht installiert zu werden, stattdessen ddev/config.yaml kopieren
– env file kopieren nur eingeschränkt möglich: jedes Projekt hat eigenen Security Key und App ID
