# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Archive::TableDefinition do

  describe '.timestamps' do
    it 'to be true with { archive: true }' do
      expect(User.column_names.include?('archived_at')).to eq(true)
    end

    it 'to be true with { archive: false }' do
      expect(License.column_names.include?('archived_at')).to eq(false)
    end
  end

end
