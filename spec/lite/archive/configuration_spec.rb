# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Archive::Configuration do
  after do
    Lite::Archive.configure do |config|
      config.all_records_archivable = false
    end
  end

  describe '.configure' do
    it 'to be "foo" for all_records_archivable' do
      Lite::Archive.configuration.all_records_archivable = 'foo'

      expect(Lite::Archive.configuration.all_records_archivable).to eq('foo')
    end
  end

end
