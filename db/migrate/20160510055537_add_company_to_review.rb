class AddCompanyToReview < ActiveRecord::Migration
  def change
    add_reference :reviews, :company, index: true, foreign_key: true
  end
end
