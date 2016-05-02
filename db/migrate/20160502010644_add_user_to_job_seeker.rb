class AddUserToJobSeeker < ActiveRecord::Migration
  def change
    add_reference :job_seekers, :user, index: true, foreign_key: true
  end
end
