# Cookbook

Install python virtual environment, blah blah

## Building

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

## Release webpage with liked pdf and epub versions

Build the pdf and epub seperately, and copy them to the build folder, then

```
sphinx-build -b html --tag release source/ build
```
