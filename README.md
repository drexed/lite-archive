# Lite::Archive

[![Gem Version](https://badge.fury.io/rb/lite-archive.svg)](http://badge.fury.io/rb/lite-archive)
[![Build Status](https://travis-ci.org/drexed/lite-archive.svg?branch=master)](https://travis-ci.org/drexed/lite-archive)

Lite::Archive is a library for archiving (soft-delete) database records.

**NOTE:** If you are coming from `ActiveArchive`, please read the [port](#port) section.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite-archive'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lite-archive

## Table of Contents

* [Configurations](#configurations)
* [Usage](#usage)
* [Methods](#methods)
* [Scopes](#scopes)
* [Callbacks](#callbacks)
* [Port](#port)

## Configurations

`rails g lite:archive:install` will generate the following file:
`../config/initalizers/lite_archive.rb`

```ruby
Lite::Archive.configure do |config|
  config.all_records_archivable = false
  config.sync_updated_at = true
end
```

## Usage

An `archived_at` column must be added to tables where you do not want records destroyed.
If the table does not have this column, records will be destroy instead of archived.

```ruby
class AddArchivedAtColumn < ActiveRecord::Migration
  def change
    create_table :table_name do |t|
      t.timestamp                # Adds archived_at automatically (if all_records_archivable is set to true)
      t.timestamp archive: true  # Adds archived_at timestamp
      t.timestamp archive: false # Does NOT add archived_at timestamp
    end

    add_timestamp :table_name

    add_column :table_name, :archived_at, :datetime # Manual column (null constraint must be false)
  end
end
```

## Methods

```ruby
user = User.first
user.archive        #=> Archives the User record and its dependents
user.unarchive      #=> Unarchives the User record and its dependents
user.to_archival    #=> Returns the User archival state locale string (ex: Archived)

User.archive_all    #=> Archives all User records and their dependents
User.unarchive_all  #=> Unarchives all User record and their dependents
```

## Scopes

```ruby
User.archived.all   #=> Returns only archived records
User.unarchived.all #=> Returns only unarchived records
```

## Callbacks

 ```ruby
 class User < ActiveRecord::Base
   # ... omitted ...

   before_archive :do_something
   after_archive :do_something

   before_unarchived :do_something
   after_unarchive :do_something

   # ... omitted ...
 end
```

## Port

`Lite::Archive` is a compatible port of [ActiveArchive](https://github.com/drexed/active_archive).

Switching is as easy as renaming `ActiveArchive` to `Lite::Archive`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lite-archive. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Archive project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lite-archive/blob/master/CODE_OF_CONDUCT.md).
