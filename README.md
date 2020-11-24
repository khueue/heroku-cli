# heroku-cli

Runs the Heroku CLI within a Docker container.

## Usage

First install the tool to your PATH (from the repo root):

```
make install
```

Then invoke it with:

```
heroku-cli
```

For example:

```
heroku-cli login # You will be prompted to log in using a browser.
heroku-cli logs --app my-app-stage
```

NOTE: Your current working directory will be mounted and available inside
the container.
