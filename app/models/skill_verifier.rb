class SkillVerifier < ActiveRecord::Base
  belongs_to :super_user
  belongs_to :skill
end
