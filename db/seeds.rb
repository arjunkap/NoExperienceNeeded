# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Job.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
# Job.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
# Job.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
# Job.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
# Job.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")


u = User.create(:first_name => "Yash", email: "4567a8sdfsd@gmail.com", password: "123456", :city => "Sydney")
u.company = Company.new(:title => "Wunderman", :abn => "12345678")
u.company.save
s = SubIndustry.create(name: "IT")
u.jobs.create(:title => "IT Staff", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Sydney", sub_industry_id: s.id, :work_type => "FT")



u = User.create(:first_name => "Yash", email: "456a7890@gmail.com", password: "123456", :city => "Canberra")
u.company = Company.new(:title => "Yahoo", :abn => "12345678")
u.company.save
s = SubIndustry.create(name: "Data Science")
u.jobs.create(:title => "Data Sciencetist", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Canberra", sub_industry_id: s.id, :work_type => "PT")


# u = User.first
# j = u.jobs.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
# # j.save

# j = u.jobs.new(:title => "IT Staff", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
# j.save



# u.company = Company.new(:title => "Yahoo", :abn => "12345678")
# u.company.save
# u.save
# j = u.jobs.new(:title => "IT Staff", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
# j.save

# a = Company.create(:company => "Google", :abn => "12345678")
# a.jobs.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
# a.jobs.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
# a.jobs.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
# a.jobs.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")

# b = Company.create(:company => "Facebook", :abn => "12345678")
# b.jobs.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")



# c = Company.create(:company => "Yahoo", :abn => "12345678")
# c.jobs.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne")
