# Phoenixtools Upgrade Plan

This repository started on Ruby 2.2 / Rails 4.2. The safest path to current versions is staged upgrades.

## Stage 1 (this change set)

- Target Ruby `2.7.8`
- Target Rails `5.2.8.1`
- Replace deprecated controller filters (`before_filter` -> `before_action`)
- Replace selected deprecated persistence APIs (`update_attributes` -> `update`)
- Remove obsolete Heroku production gems (`rails_12factor`, `rails_serve_static_assets`, `rails_stdout_logging`)
- Update static file server config to `config.public_file_server.enabled`

## Stage 1 commands

Run these after installing Ruby 2.7:

```powershell
bundle _2.4.22_ install
bundle update rails
bundle exec rake db:migrate
bundle exec rspec
```

If dependency resolution fails, update gems in small groups:

- `rails`, `railties`, `actionpack`, `activerecord`
- `rails_admin`, `kaminari`
- `rspec-rails`, `web-console`, `spring`

## Stage 2

- Ruby `3.1+`
- Rails `6.1`
- Replace remaining `update_attributes!` with `update!`
- Move from `secrets`/initializer secret handling toward credentials

## Stage 3

- Ruby `3.2+`
- Rails `7.1+`
- Evaluate replacing CoffeeScript + legacy Sprockets dependencies if desired
- Refresh CI/build scripts and deployment config

