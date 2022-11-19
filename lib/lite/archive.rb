# frozen_string_literal: true

require "active_record" unless defined?(ActiveRecord)
require "active_support" unless defined?(ActiveSupport)

require "generators/lite/archive/install_generator" if defined?(Rails::Generators)

require "lite/archive/railtie" if defined?(Rails::Railtie)
require "lite/archive/version"
require "lite/archive/configuration"
require "lite/archive/schema_statement"
require "lite/archive/table_definition"
require "lite/archive/methods"
require "lite/archive/scopes"
require "lite/archive/base"
