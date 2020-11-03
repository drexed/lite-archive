# frozen_string_literal: true

module Lite
  module Archive
    module TableDefinition

      def timestamps(**options)
        options[:null] = false if options[:null].nil?
        options[:precision] ||= 6 if @conn.supports_datetime_with_precision?

        column(:created_at, :datetime, **options)
        column(:updated_at, :datetime, **options)

        return unless Lite::Archive.configuration.all_records_archivable == true
        return if options[:archive] == false

        options[:null] = true
        column(:archived_at, :datetime, **options)
      end

    end
  end
end

ActiveRecord::ConnectionAdapters::Table.prepend(Lite::Archive::TableDefinition)
ActiveRecord::ConnectionAdapters::TableDefinition.prepend(Lite::Archive::TableDefinition)
