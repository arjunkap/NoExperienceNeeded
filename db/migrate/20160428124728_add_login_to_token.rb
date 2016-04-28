class AddLoginToToken < ActiveRecord::Migration
  def change
    add_reference :tokens, :login, index: true, foreign_key: true
  end
end
