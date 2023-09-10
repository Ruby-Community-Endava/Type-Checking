# README

## Sorbet Typing

### 1. Install Sorbet
Add this gems to Gemfile development block:
```
gem 'sorbet-runtime'

# In development block:
gem 'sorbet'
gem 'tapioca'
```

### 2. Run tapioca
To generate initial files run:
```
bundle exec tapioca init
```
This will generate `sorbet/` subdirectory with the rails .rbi files. Then run:

```
bundle exec tapioca dsl
```

To generate additional Rails DSL files.

## Start adding files for Typechecking
To start adding files for typechecking, add the following to the top of the file:
```
# typed: [true|strict]
```
This way the file will be included in the sorbet typechecking process. More information about the typed sigils [here](https://sorbet.org/docs/static).

## Typechecking
To run the typechecking process run:
```
bundle exec srb tc
```

## Tools
- https://sorbet.org/docs/vscode
