# ProjectSend for LazyCat

LazyCat LPK v2 packaging for [ProjectSend](https://github.com/projectsend/projectsend), a free and open source client file-sharing application focused on ease of use and privacy.

## Runtime

- Single ProjectSend `2.3.0` instance with MySQL 8.4 and Redis 7.
- HTTP is terminated by LazyCat and forwarded to the official ProjectSend image on port 80; no external nginx or certbot service is packaged.
- Public share links and the login page are reachable without LazyCat authentication and use ProjectSend's own access controls.
- The initial administrator is created from setup-wizard parameters and the `/login` form is autofilled.
- Uploads, the generated Laravel `APP_KEY`, MySQL, and Redis data persist under `/lzcapp/var/projectsend`.
- Upload and download flows include the LazyCat file-picker injection.

The supplied logo is preserved as a 180×180 PNG.

The LazyCat store already contains an unrelated package named “Project Send” (`peterpig.lzcapp.projectsend`). This repository uses the distinct package ID `community.lazycat.app.projectsend` as explicitly requested.

## Build

```sh
lzc-cli project release -o dist/application.lpk
```

## GitHub Actions

The scheduled workflow follows stable SemVer tags for `projectsend/projectsend`, creates a versioned GitHub Release asset, and publishes only to the MiaoMiao private store.

Required repository or organization Secrets:

- `APPSTORE_URL`
- `APPSTORE_TOKEN`

Optional Secrets:

- `APP_ID`
- `PRIVATE_STORE_GROUP_CODES`
