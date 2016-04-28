class AddReportedAboutToReport < ActiveRecord::Migration
  def change
    add_column :reports, :reported_about, :integer
  end
end
