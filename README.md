> Markdown Vorschau:Cmd + K, V

# Einmalige Einrichtung: Github mit SSH verwenden
Wir clonen und pullen Projekte per SSH von unserer Bash aus. Eine SSH-Agent-Weiterleitung ermöglicht, auch auf der Remote-Bash (Hosting-Server) Git Befehle auszuführen.

## SSH Schlüssel anlegen
Auf jeder Arbeitsstation muss ein SSH-Schlüssel angelegt werden: 
https://docs.github.com/de/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Schlüssel in Github hinterlegen
Danach muss der Schlüssel in Github abgelegt werden: 
https://docs.github.com/de/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

## Agent Forwarding aktivieren
In der `/etc/ssh/ssh_config` das Agent Forwarding aktivieren (default ist false). etc ist ein symlink auf private/etc.
/etc/ssh/ssh_config
````
ForwardAgent yes
````

## Schlüssel in Keychain aufnehmen
Der private Schlüssel muss einmalig in die Keychain aufgenommen werden. Leider kann es sein, dass es bei jeder Sitzung wiederholt werden muss.
```
ssh-add -K ~/.ssh/id_ed25519
```

# SSH-Agent-Weiterleitung pro Projekt einrichten

Für jedes Projekt muss der Hosting-Server in die Datei `~/.ssh/config` aufgenommen werden. 
https://docs.github.com/de/developers/overview/using-ssh-agent-forwarding
```
Host SERVERNAME  
    ForwardAgent yes
```

Einmalig normal per SSH verbinden und `ssh-add` ausführen:
```
eval `ssh-agent -s`
ssh-add
```

# PHP in der SSH Bash einrichten

## Hostpoint
https://support.hostpoint.ch/de/produkte/webhosting/haeufig-gestellte-fragen/pfade-verzeichnisse-system 
````
alias php='/usr/local/php81/bin/php' 
echo "alias php='/usr/local/php81/bin/php'" >> ~/.bash_profile

export PATH=/usr/local/php81/bin:$PATH
echo "export PATH=/usr/local/php81/bin:\$PATH" >> ~/.bash_profile 
````

## Metanet
https://support.metanet.ch/713#10591-php
````
alias php='/opt/php80/bin/php' 
echo "alias php='/opt/php80/bin/php'" >> ~/.bash_profile

export PATH=/opt/php80/bin:$PATH
echo "export PATH=/opt/php80/bin:\$PATH" >> ~/.bash_profile 
````

# Projekt aufsetzen

1. Github repository anlegen `domain.tld`
2. Git repository clonen mit `git clone` [HTTPS URL]
3. [Craft CMS installieren](https://craftcms.com/docs/4.x/installation.html)
4. `.vscode`, `.gulpfile.js`, `.gitignore` von letztem Projekt kopieren
5. `ddev config`: domain.tld, 
6. `colima start`
7. `ddev start`
8. `ddev status` um URL und Verbindung zu DB auszulesen
9. `ddev ssh`
10. `php craft setup`
11. Daten aus Schritt ddev status verwenden. Site URL ist die ddev web URL.
12. Site language üblicherweise de-CH
13. Admin login `xxx-admin` mit xxx = Kundenkürzel
14. Craft Pro aktivieren (Testversion)
15. Plugins installieren
    - Password Policy: Alle Schalter an, Minimum 20 Zeichen
    - AsyncQueue

# Projektspezifische Einstellungen

## Asset Volumen ausschliessen
In jedem Volume braucht es eine `.gitignore`.
````
*
!.gitignore
````

# Craft Synchronisierung
Wenn wir nur Gestaltung und Struktur ändern, behalten wir die Datenbank auf dem Server Zielsystem ohne Änderung, wir überschreiben sie nicht. Redakteure können unterdessen weiterarbeiten. Wenn wir aber Inhalte ändern, sperren wir das Redaktionssystem auf dem Server Zielsystem gegen Bearbeitungen und überschreiben die Datenbank, wenn wir fertig sind.

## Voraussetzungen
- Die .env Datei ist _nicht_ im Git
- ddev/config.yaml ist im Git
- Aktuelle Version von rsync: `brew install rsync`

## Von ddev nach Github
- (Werkzeuge › Projektkonfiguration › YAML-Änderungen anwenden)
- `ddev ssh`
- mysql dump in Hauptverzeichnis: `mysqldump --add-drop-database db > dump.sql`
- `exit`
- git push

## Von Github nach ddev
- Git pull
- `ddev ssh`
- Datenbank überschreiben: `mysql db < dump.sql`
- Update Craft dependencies `composer install --no-interaction`
- Projektkonfiguration aktualisieren: `php craft up`

## Von ddev auf den Server
Die Datenbank darf nicht überschrieben werden, wenn Redakteure bereits Inhalte einpflegen. Es denn, wir machen einen Redaktionsfreeze (ankündigen bitte). 

- Prüfen ob ssh-agent ausgeführt wird: `echo "$SSH_AUTH_SOCK"` (lokal)
- Prüfen ob ssh-agent sichtbar ist: `ssh-add -L` 
    - Falls nicht: `ssh-add SCHLÜSSEL` SCHLÜSSEL -> ~/.ssh/id_ed25519
- Per SSH verbinden mit Parameter `-A` vor Benutzernamen
- Git clone beim ersten Mal
– oder pull oder `git-pull --force` danach
- Datenbank überschreiben
    - Metanet: `mysql -h 127.0.0.1 -u dev_profitlich_craft -p dev_profitlich_craft < dump.sql`
    - Hostpoint: `mysql -h HOSTINGBENUTZER.mysql.db.internal -u DATENBANKBENUTZER -p DATENBANK < dump.sql`
- Update Craft dependencies `composer install --no-interaction`
- Projektkonfiguration aktualisieren: `php craft up`

## Von Server zu ddev
- `ssh`
- Datenbank dump: `mysqldump -u BENUTZERNAME -p DATENBANKNAME > dump.sql`
- Assets kopieren: `rsync -a -e 'ssh -p 2121' profitlich-ssh@profitlich.ch:/staging.profitlich.ch/web/assets/ web/assets/`


### Erläuterung des mysql Befehls
**mysql | -h 127.0.0.1 | -u dev_profitlich_craft | -p | dev_profitlich_craft | < | dump.sql**
Rufe mySQL auf  
Verbinde mit Host  
Benutze ein Passwort  
Datenbankname  
überschreibe von  
Datei, mit der überschrieben werden soll


# Git Vorgehen
- Die aktuelle Version ist der main branch
- TODO: Vorgehen mit Releases entwickeln (vor allem wenn das Projekt produktiv ist)
- branch aus issue generieren in Github
- pull request von issue branch nach main, dabei `close` in den Kommentar schreiben, um das issue zu schliessen
- Schliesst der branch weitere issues, diese jweiles so mit ihrer Nummer angeben: `closes #0`
- In VS Code alte branches löschen: `git fetch --prune`
### Bei Konflikten
- Konflikt: dateModified config/project/config.yaml auf das neuere Datum (höhere Zahl)
- Konflikt: fields, entries etc. absprechen, was bleibt und gelöscht wird
- Merge
- `checkout dev`, `git pull dev`
- `checkout dev-name`, `git pull origin dev` (origin dev, weil sonst dev-name gepullt wird)


# Assets Synchronisierung

    rsync -a -e 'ssh -p 2121' profitlich-ssh@profitlich.ch:/staging.profitlich.ch/web/assets/ web/assets/


# Craft Updates

Updates werden nur lokal (Umgebung development) durchgeführt. Die Datei `composer.json`muss für Updates gemäss SemVer vorbereitet sein: Versionen brauchen eine Erlaubnis zum Update mit `^3.5.2` statt `3.5.2` (^ minor updates, ~ patch update).  
https://nystudio107.com/blog/updating-craft-cms-without-headaches

Stand 3.1.2023 darf Composer nicht höher als Version 2.2.15 sein (https://github.com/craftcms/cms/issues/12482)  
```
composer self-update 2.2.15   // Stand 3.1.2023
ddev ssh
composer update
```

# Lese- und Recherchestoff

Branches  
https://craftcms.stackexchange.com/questions/39133/multiple-developers-working-on-the-same-site-project-config-issues

Lokale Updates  
https://nystudio107.com/blog/updating-craft-cms-without-headaches

Deploy your site with git  
https://gist.github.com/nichtich/5290675

Git workflow  
https://gist.github.com/Nilpo/8ed5e44be00d6cf21f22

Git repo auf dem Server mit --bare initialisieren, so dass keine Arbeitsdateien dort gespeichert werden.

Risiken eines Git auf dem Server  
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
– env file kopieren nur eingeschränkt möglich: jedes Projekt hat eigenen Security Key und App ID