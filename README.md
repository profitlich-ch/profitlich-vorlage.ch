# Craft Synchronisierung

## Voraussetzungen
- .env Datei ist im Git
- ddev/config.yaml ist im Git

## Schritte
Quellsystem
- Werkzeuge › Projektkonfiguration › YAML-Änderungen anwenden
- Alte dump.sql löschen
- Git push
- mysql dump in Hauptverzeichnis: `mysqldump db > dump.sql`

Zielsystem
- Git pull
- SQL dump in Hauptverzeichnis legen
- Datenbank überschreiben: `mysql db < dump.sql`
- Update Craft dependencies `composer install --no-interaction`
- Projektkonfiguration aktualisieren: `php craft up `



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