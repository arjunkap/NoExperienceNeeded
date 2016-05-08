class RenameColumnCompany < ActiveRecord::Migration
  def change
  	rename_column :companies, :company, :title
  end
end
