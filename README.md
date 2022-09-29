# Craft Synchronisierung

## Voraussetzungen
- Die .env Datei ist _nicht_ im Git
- ddev/config.yaml ist im Git
- Aktuelle Version von rsync: `brew install rsync`



## Schritte

### Quellsystem
- Werkzeuge › Projektkonfiguration › YAML-Änderungen anwenden
- Alte dump.sql löschen
- Git push
- mysql dump in Hauptverzeichnis: `mysqldump db > dump.sql`

### ddev Zielsystem 
- Git pull
- `ddev ssh`
- Datenbank überschreiben: `mysql db < dump.sql`
- Update Craft dependencies `composer install --no-interaction`
- Projektkonfiguration aktualisieren: `php craft up`

### Server Zielsystem 
- Git pull 
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


# Assets Synchronisierung

    rsync -a -e 'ssh -p 2121' profitlich-ssh@profitlich.ch:/staging.profitlich.ch/web/assets/ web/assets/


# Lese- und Recherchestoff

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