class AddSkillToSkillVerifier < ActiveRecord::Migration
  def change
    add_reference :skill_verifiers, :skill, index: true, foreign_key: true
  end
end
