# frozen_string_literal: true

# Add Status to Comments table
class AddStatusToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :status, :string
  end
end
