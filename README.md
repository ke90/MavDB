# MavDB
# Mitarbeiterverzeichnis-Datenbank

Dieses Repository enthält die Konfiguration für den SQL Server-Container, der die Datenbank für unser Mitarbeiterverzeichnis betreibt. Der Container kann leicht mit Docker Compose gestartet werden.

## Voraussetzungen

Bevor Sie beginnen, stellen Sie sicher, dass die folgenden Voraussetzungen erfüllt sind:

- Docker ist auf Ihrem System installiert. Die Installationsanleitungen für verschiedene Betriebssysteme finden Sie [hier](https://docs.docker.com/get-docker/).
- Docker Compose ist installiert. Die Installationsanleitung finden Sie [hier](https://docs.docker.com/compose/install/).

## Konfiguration

Die Konfigurationsdatei `docker-compose.yml` definiert die Dienste, Netzwerke und Volumes, die für den Betrieb des SQL Server-Containers erforderlich sind. Sie müssen diese Datei nicht ändern, um den Container zu starten, es sei denn, Sie möchten benutzerdefinierte Konfigurationen vornehmen.

## Den Container starten

Führen Sie den folgenden Befehl im Wurzelverzeichnis dieses Repositories aus, um den SQL Server-Container zu starten:

```bash
docker-compose up --build
