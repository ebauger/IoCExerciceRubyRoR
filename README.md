# README

Setup your env with devbox

## (Optional) Install devbox on macOS / Linux / WSL2
```
curl -fsSL https://get.jetpack.io/devbox | bash
```

## Init env and open a shell on it

```bash
devbox shell
bundle install
```

## Run the task backup
```
rake backup:run --trace
```

Should see ./bacukps/archive.zip is created