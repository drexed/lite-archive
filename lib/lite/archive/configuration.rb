# frozen_string_literal: true

module Lite
  module Archive

    class Configuration

      attr_accessor :all_records_archivable, :sync_updated_at

      def initialize
        @all_records_archivable = false
        @sync_updated_at = true
      end

    end

    class << self

      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end

      def reset_configuration!
        @configuration = Configuration.new
      end

    end

  end
end
