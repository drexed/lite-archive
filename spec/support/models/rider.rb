# frozen_string_literal: true

class Rider < ActiveRecord::Base

  belongs_to :requester, polymorphic: true

end
