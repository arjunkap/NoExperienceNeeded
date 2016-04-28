class AddSuperUserToSkillVerifier < ActiveRecord::Migration
  def change
    add_reference :skill_verifiers, :super_user, index: true, foreign_key: true
  end
end
