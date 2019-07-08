# frozen_string_literal: true

require 'rails/railtie'

module Lite
  module Archive
    class Railtie < ::Rails::Railtie

      initializer 'lite-archive' do |app|
        Lite::Archive::Railtie.instance_eval do
          [app.config.i18n.available_locales].flatten.each do |locale|
            path = File.expand_path("../../../config/locales/#{locale}.yml", __FILE__)
            next if !File.file?(path) || I18n.load_path.include?(path)

            I18n.load_path << path
          end
        end
      end

    end
  end
end
