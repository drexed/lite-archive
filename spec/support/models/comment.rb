# frozen_string_literal: true

class Comment < ActiveRecord::Base

  belongs_to :user, counter_cache: true

end
