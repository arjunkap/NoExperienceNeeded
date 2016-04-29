class AddCompanyToSuperUser < ActiveRecord::Migration
  def change
    add_reference :super_users, :company, index: true, foreign_key: true
  end
end
