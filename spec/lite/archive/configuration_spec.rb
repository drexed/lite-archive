# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Archive::Configuration do
  after(:all) do
    Lite::Archive.configure do |config|
      config.all_records_archivable = false
    end
  end

  describe '.configure' do
    it 'to be "91 test" for all_records_archivable' do
      Lite::Archive.configuration.all_records_archivable = '91 test'

      expect(Lite::Archive.configuration.all_records_archivable).to eq('91 test')
    end
  end

end
