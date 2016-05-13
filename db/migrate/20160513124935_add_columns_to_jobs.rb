class AddColumnsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :question1, :string
    add_column :jobs, :question2, :string
    add_column :jobs, :question3, :string
  end
end
