# Decidim::CasClient

Integration of CAS login and verification.

## Usage

Decidim::CasClient will be available as a Feature for a Participatory
Space.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-cas_client
```

And then execute:

```bash
bundle
```

## Database modifications

For the correct use of this CAS client, there is a migration that modifies the database in these ways:

- Added `username` (`STRING`) field
- Added `extra_attributes` (`JSONB`) field
- Added index for `username` field
- Modified index for `email` and `organization_id` to not be unique

## Contributing

See [Decidim](https://github.com/decidim/decidim).

## License

This engine is distributed under the GNU AFFERO GENERAL PUBLIC LICENSE.
