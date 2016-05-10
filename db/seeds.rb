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


# u = User.create(:first_name => "Yash", email: "4567a8sdfsd@gmail.com", password: "123456", :city => "Sydney")
# u.company = Company.new(:title => "Wunderman", :abn => "12345678")
# u.company.save
# s = SubIndustry.create(name: "IT")
# u.jobs.create(:title => "IT Staff", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Sydney", sub_industry_id: s.id, :work_type => "FT")



# u = User.create(:first_name => "Yash", email: "456a7890@gmail.com", password: "123456", :city => "Canberra")
# u.company = Company.new(:title => "Yahoo", :abn => "12345678")
# u.company.save
# s = SubIndustry.create(name: "Data Science")
# u.jobs.create(:title => "Data Sciencetist", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Canberra", sub_industry_id: s.id, :work_type => "PT")




###############
#Interview
# u = User.create(:first_name => "Yash", email: "12504@gmail.com", password: "123456", :city => "Sydney")
#u.job_seeker = JobSeeker.create(mobile_number: "0416021705")
# u = JobSeeker.first
# c = Company.first
# first = u.interview_reviews.create(company_id: c.id, company_name: c.title, description: "The interview was great", position: "Software developer", experience: "Graduate level", offer:  true, difficulty: 5, duration: 1)
# second = u.interview_reviews.create(company_id: c.id, company_name: c.title, description: "The interview was great", position: "Software engineer", experience: "2 years experience", offer:  true, difficulty: 4, duration: 1)
# third = u.interview_reviews.create(company_id: c.id, company_name: c.title, description: "The interview was great", position: "Technological analyst", experience: "Graduate level", offer:  true, difficulty: 5, duration: 1)
# fourth = u.interview_reviews.create(company_id: c.id, company_name: c.title, description: "The interview was great", position: "Software developer", experience: "Graduate level", offer:  true, difficulty: 10, duration: 1)

# iq  = first.interview_questions.new
# q = Question.create(:question => "How was your interview expereience ?")
# iq.question_id = q.id
# iq.save


###############


###################

#Review
u = User.create(:first_name => "Yash", email: "yash.narwal@gmail.com", password: "123456", :city => "Sydney")
u.company = Company.create(abn: "12345679", title: "Google")
u.company.save

c = Company.last

c.reviews.create(title: "This is a review", isAnonymous: true, description: "This is a verry good interviews", company_name: "Google")


c.reviews.create(title: "This is a review", isAnonymous: true, description: "This is a verry good interviews", company_name: "Google")


c.reviews.create(title: "This is a review", isAnonymous: true, description: "This is a verry good interviews", company_name: "Google")



c.reviews.create(title: "This is a review", isAnonymous: true, description: "This is a verry good interviews", company_name: "Microsoft")


c.reviews.create(title: "This is a review", isAnonymous: true, description: "This is a verry good interviews", company_name: "Mocrosoft")



####################