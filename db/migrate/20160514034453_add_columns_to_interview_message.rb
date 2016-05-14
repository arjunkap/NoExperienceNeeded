class AddColumnsToInterviewMessage < ActiveRecord::Migration
  def change
    add_column :interview_messages, :job_seeker_id, :integer
    add_column :interview_messages, :job_id, :integer
  end
end
