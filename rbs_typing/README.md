# RBS Typing Setup

## 1. Install RBS/Steep
First, add the gems to the Gemfile:
```bash
gem "rbs"
gem "rbs_rails"
gem "steep"
```
And run `bundle install`.

## 2. RBS Rails
Then, autogenerate types for rails using the gem rbs_rails, first run:

```bash
rails g rbs_rails:install
```

This will generate a task in `lib/tasks/rbs.rake` that you can run:

```bash
rake rbs_rails:all
```

And a `sig` folder will be created in the root of the project with all the types that the Gem can autogenerate for rails.

## 3. RBS Collections
Then, you can add the types for the gems that have information in the community managed gem_rbs_collection. You run:

```bash
rbs collection init
```

Then you need to update the rbs_collection.yaml file with the gems that you want to add types for, an example of the file is in this repo.

Then you can run:

```bash
rbs collection install
```

This will include the types in `.gem_rbs_collection/` folder.

## 4. Steep Configuration
Then, you need to configure steep, you can do this by running:

```bash
steep init
```

This will create a `Steepfile` in the root of the project, you can configure the file to your liking, an example of the file is in this repo.

## 5. Next steps
After this you can run `steep check` to check the types of your project.
