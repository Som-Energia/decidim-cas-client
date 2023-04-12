# Decidim::CasClient

Integration of CAS login and verification.

## Usage

Decidim::CasClient will be available as a Feature for a Participatory
Space.

## Installation

Add these lines to your application's Gemfile:

```ruby
gem 'decidim-cas_client, git: "https://github.com/Som-Energia/decidim-cas-client"'
gem 'codit-devise-cas-authenticable, git: "https://github.com/Som-Energia/codit-devise-cas-authenticable"'
```

And then execute:

```bash
bundle
bundle exec rails decidim_cas_client:install:migrations
```

## Database modifications

For the correct use of this CAS client, there is a migration that modifies the database in these ways:

- Added `username` (`STRING`) field
- Added `extra_attributes` (`JSONB`) field
- Added index for `username` field
- Modified index for `email` and `organization_id` to not be unique


> **IMPORTANT:**
>
> This module makes use of the [Deface](https://github.com/spree/deface) gem.
> In conjuntion with other modules (we know [Term Customizer](https://github.com/mainio/decidim-module-term_customizer/) is one of them) it might cause errors when precompiling assets for production sites. But only if during this process the compiling machine does not have access to the database.
>
> It is easy to overcome this problem. Just add the following line to your `config/environments/production.rb` file:
> 
> ```ruby
> config.deface.enabled = ENV['DB_ADAPTER'].blank? || ENV['DB_ADAPTER'] == 'postgresql'
> ```
>
> Then precompile with these ENV enabled in your CI:
>
> ```bash
> DB_ADAPTER=nulldb RAILS_ENV=production rake assets:precompile
> ```
>
> Alternatively, use any other ENV var to set up the `config.deface.enabled` to `false` during the precompilation phase.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Som-Energia/decidim-cas-client.

### Developing

To start contributing to this project, first:

- Install the basic dependencies (such as Ruby and PostgreSQL)
- Clone this repository

Decidim's main repository also provides a Docker configuration file if you
prefer to use Docker instead of installing the dependencies locally on your
machine.

You can create the development app by running the following commands after
cloning this project:

```bash
bundle
DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rake development_app
```

Note that the database user has to have rights to create and drop a database in
order to create the dummy test app database.

Then to test how the module works in Decidim, start the development server:

```bash
DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bin/rails s
```

Note that `bin/rails` is a convenient wrapper around the command `cd development_app; bundle exec rails`.

In case you are using [rbenv](https://github.com/rbenv/rbenv) and have the
[rbenv-vars](https://github.com/rbenv/rbenv-vars) plugin installed for it, you
can add the environment variables to the root directory of the project in a file
named `.rbenv-vars`. If these are defined for the environment, you can omit
defining these in the commands shown above.

#### Webpacker notes

As latests versions of Decidim, this repository uses Webpacker for Rails. This means that compilation
of assets is required everytime a Javascript or CSS file is modified. Usually, this happens
automatically, but in some cases (specially when actively changes that type of files) you want to 
speed up the process. 

To do that, start in a separate terminal than the one with `bin/rails s`, and BEFORE it, the following command:

```bash
bin/webpack-dev-server
```

#### Code Styling

Please follow the code styling defined by the different linters that ensure we
are all talking with the same language collaborating on the same project. This
project is set to follow the same rules that Decidim itself follows.

[Rubocop](https://rubocop.readthedocs.io/) linter is used for the Ruby language.

You can run the code styling checks by running the following commands from the
console:

```bash
bundle exec rubocop
```

To ease up following the style guide, you should install the plugin to your
favorite editor, such as:

- Sublime Text - [Sublime RuboCop](https://github.com/pderichs/sublime_rubocop)
- Visual Studio Code - [Rubocop for Visual Studio Code](https://github.com/misogi/vscode-ruby-rubocop)

#### Non-Ruby Code Styling

There are other linters for Javascript and CSS. These run using NPM packages. You can
run the following commands:

1. `npm run lint`: Runs the linter for Javascript files.
2. `npm run lint-fix`: Automatically fix issues for Javascript files (if possible).
3. `npm run stylelint`: Runs the linter for SCSS files.
4. `npm run stylelint-fix`: Automatically fix issues for SCSS files (if possible).

### Testing

To run the tests run the following in the gem development path:

```bash
bundle
DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rake test_app
DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rspec
```

Note that the database user has to have rights to create and drop a database in
order to create the dummy test app database.

In case you are using [rbenv](https://github.com/rbenv/rbenv) and have the
[rbenv-vars](https://github.com/rbenv/rbenv-vars) plugin installed for it, you
can add these environment variables to the root directory of the project in a
file named `.rbenv-vars`. In this case, you can omit defining these in the
commands shown above.

### Test code coverage

Running tests automatically generates a code coverage report. To generate the complete report run all the tests using this command:

```bash
bundle exec rspec
```

This will generate a folder named `coverage` in the project root which contains
the code coverage report.

### Localization

If you would like to see this module in your own language, you can help with its
translation at Crowdin:

https://crowdin.com/project/decidim-cas_client

## License

See [LICENSE-AGPLv3.txt](LICENSE-AGPLv3.txt).