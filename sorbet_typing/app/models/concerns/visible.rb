# frozen_string_literal: true
# typed: strict

# Concern to check for valid status
module Visible
  extend T::Sig
  extend ActiveSupport::Concern

  VALID_STATUSES = T.let(%w[public private archived].freeze, T::Array[String])

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    extend T::Sig

    sig { returns(Integer) }
    def public_count
      where(status: 'public').count
    end
  end

  sig { returns(T::Boolean) }
  def archived?
    status == 'archived'
  end
end
