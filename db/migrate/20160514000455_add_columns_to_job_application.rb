class AddColumnsToJobApplication < ActiveRecord::Migration
  def change
    add_column :job_applications, :question1, :string
    add_column :job_applications, :question2, :string
    add_column :job_applications, :question3, :string
  end
end
