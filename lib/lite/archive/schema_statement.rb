# frozen_string_literal: true

module Lite
  module Archive
    module SchemaStatement

      def add_timestamps(table_name, **options)
        options[:null] = false if options[:null].nil?
        options[:precision] ||= 6 if supports_datetime_with_precision?

        add_column(table_name, :created_at, :datetime, **options)
        add_column(table_name, :updated_at, :datetime, **options)

        return unless Lite::Archive.configuration.all_records_archivable == true
        return if options[:archive] == false

        options[:null] = true
        add_column(table_name, :archived_at, :datetime, **options)
      end

    end
  end
end

ActiveRecord::Migration.prepend(Lite::Archive::SchemaStatement)
