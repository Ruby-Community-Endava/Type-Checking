# frozen_string_literal: true

# Comment model
class Comment < ApplicationRecord
  include Visible

  belongs_to :article
end
