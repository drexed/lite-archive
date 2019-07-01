# frozen_string_literal: true

ActiveRecord::Base.time_zone_aware_attributes = true
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:',
  encoding: 'utf8',
  pool: 5,
  timeout: 5000,
  verbosity: 'quiet'
)

ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define(version: 1) do
  create_table :users, force: true do |t|
    t.string :name
    t.integer :cars_count, default: 0
    t.integer :comments_count, default: 0
    t.timestamps null: false
  end

  create_table :licenses, force: true do |t|
    t.references :user
    t.string :number
    t.timestamps archive: false
  end

  create_table :bios, force: true do |t|
    t.references :user
    t.string :hobbies
    t.timestamps null: false
  end

  create_table :riders, force: true do |t|
    t.references :requester, polymorphic: true
    t.timestamps null: false
  end

  create_table :comments, force: true do |t|
    t.references :user
    t.text :body
    t.timestamps null: false
  end

  create_table :cars, force: true do |t|
    t.references :user
    t.integer :number
    t.text :options
    t.text :properties
    t.datetime :created_at
    t.datetime :updated_at
    t.datetime :archived_at
  end

  create_table :insurances, force: true do |t|
    t.references :car
    t.string :provider
  end

  create_table :drivers, force: true do |t|
    t.references :car
    t.string :name
    t.timestamps null: false
  end
end
