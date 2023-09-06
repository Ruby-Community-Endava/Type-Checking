# typed: true

module Visible
  extend T::Sig
  extend T::Helpers

  sig { returns(String) }
  def status; end

  sig { params(status: String).returns(T::Boolean) }
  def status=(status); end

  sig { params(status: Symbol, inclusion: T::Hash[Symbol, T.untyped]).returns(T::Array[String]) }
  def self.validates(status, inclusion); end

  module ClassMethods
    extend T::Sig

    sig { params(args: T.untyped, blk: T.untyped).returns(ActiveRecord::Relation) }
    def where(*args, &blk); end
  end
end
