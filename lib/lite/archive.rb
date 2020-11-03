# frozen_string_literal: true

require 'active_record'
require 'active_support'

require 'lite/archive/version'
require 'lite/archive/railtie' if defined?(Rails)

%w[configuration schema_statement table_definition methods scopes base].each do |name|
  require "lite/archive/#{name}"
end

require 'generators/lite/archive/install_generator'
