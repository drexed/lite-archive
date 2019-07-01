# frozen_string_literal: true

module Lite
  module Archive
    module Scopes

      def archived
        where.not(archived_at: nil)
      end

      def unarchived
        where(archived_at: nil)
      end

    end
  end
end
