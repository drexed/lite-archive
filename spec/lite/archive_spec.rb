# frozen_string_literal: true

RSpec.describe Lite::Archive do

  it 'to be a version number' do
    expect(Lite::Archive::VERSION).not_to be nil
  end

end
