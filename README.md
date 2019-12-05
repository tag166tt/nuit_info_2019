# Nuit de l'info 2019

Repo principal.

## Instructions

```bash
./dev.sh
```

Puis, il sufit d'ouvrir [localhost:8000](http://localhost:8000).

## Création d'un nouveau service

1. Créer le repo (en public, ou alors il faut donner l'accès à tout ceux du groupe)
2. Le cloner
3. L'ajouter en tant que submodule: `git submodule add git@github.com:username/service-name.git name`. Attention: il faut que le repo ne soit pas vide.
4. Créer le service dans `docker-compose.yml`; lui mettre un port spécifique pour permettre les tests
5. Ne pas oublier d'ajouter le service au `depends_on` de `nginx` dans `docker-compose.yml`
6. Ajouter les routes publiques (accessibles depuis le frontend) dans `services/nginx/nginx.conf`
7. Pendant le développement, changer le volume vers le repo local
8. Si besoin d'ajouter des dépendances, push le repo & update le clone local
9. Pour les migrations: faire en sorte de lancer les migrations au lancement du service

Exemple de configuration pour lumen:
```yaml
  test:
    build: ./services/test-srv
    restart: always
    volumes:
      - ./services/test-srv:/application
    command: php -S 0.0.0.0:8000 -t public
    ports:
      - "3002:8000"
    depends_on:
      - postgres
```

## Services

### Frontend

Application web avec l'utilisateur interagit.

### Users

API qui permet de stocker les comptes des utilisateurs.

