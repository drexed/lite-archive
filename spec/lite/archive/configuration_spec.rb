# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Archive::Configuration do
  after { Lite::Archive.reset_configuration! }

  describe '.configure' do
    it 'to be "foo"' do
      Lite::Archive.configuration.all_records_archivable = 'foo'

      expect(Lite::Archive.configuration.all_records_archivable).to eq('foo')
    end
  end

  describe '.reset_configuration!' do
    it 'to be false' do
      Lite::Archive.configuration.all_records_archivable = 'foo'
      Lite::Archive.reset_configuration!

      expect(Lite::Archive.configuration.all_records_archivable).to eq(false)
    end
  end

end
