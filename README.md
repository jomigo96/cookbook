# Cookbook

Check it out here https://jomigo96.github.io/cookbook/


## Building

Install python virtual environment, blah blah

HTML

```
sphinx-build -b html source/ build
```

Latex pdf

```
sphinx-build -b latex source/ build
cd build
make
```

epub

```
sphinx-build -b epub source/ build
```

There's a docker image with the dependencies already installed.

## Release webpage with liked pdf and epub versions

Build the pdf and epub seperately, and copy them to the build folder, then

```
sphinx-build -b html --tag release source/ build
```

## Deploy

Pushing to `release` triggers the website build and deployment. Consult the github action.

## Images

Use the `scripts/adjust.sh` script to prepare images before committing!

