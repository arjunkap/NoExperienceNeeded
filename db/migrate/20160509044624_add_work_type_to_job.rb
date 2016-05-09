class AddWorkTypeToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :work_type, :string
  end
end
