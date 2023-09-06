# frozen_string_literal: true
# typed: strict

# Comment model
class Comment < ApplicationRecord
  include Visible

  belongs_to :article
end
