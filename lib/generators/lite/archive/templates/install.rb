# frozen_string_literal: true

Lite::Archive.configure do |config|
  config.all_records_archivable = false
  config.sync_updated_at = true
end
