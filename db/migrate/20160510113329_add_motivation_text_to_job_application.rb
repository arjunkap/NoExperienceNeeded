class AddMotivationTextToJobApplication < ActiveRecord::Migration
  def change
    add_column :job_applications, :motivation_text, :text
  end
end
