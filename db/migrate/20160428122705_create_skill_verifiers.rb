class CreateSkillVerifiers < ActiveRecord::Migration
  def change
    create_table :skill_verifiers do |t|

      t.timestamps null: false
    end
  end
end
