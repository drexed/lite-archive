# frozen_string_literal: true

require 'active_record' unless defined?(ActiveRecord)
require 'active_support' unless defined?(ActiveSupport)

require 'generators/lite/archive/install_generator' if defined?(Rails::Generators)

require 'lite/archive/railtie' if defined?(Rails::Railtie)
require 'lite/archive/version'

%w[configuration schema_statement table_definition methods scopes base].each do |name|
  require "lite/archive/#{name}"
end
