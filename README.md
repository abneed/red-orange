# Red Orange Web Application

## System Requirements

To make this project work, you need ruby version 2.4.2 installed in your system.

## Getting started

To get started with the app, clone the repo, and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```