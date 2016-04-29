class AddUserToSkillVerifier < ActiveRecord::Migration
  def change
    add_reference :skill_verifiers, :user, index: true, foreign_key: true
  end
end
