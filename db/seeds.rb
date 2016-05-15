# # # # This file should contain all the record creation needed to seed the database with its default values.
# # # # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# # # #
# # # # Examples:
# # # #
# # # #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# # # #   Mayor.create(name: 'Emanuel', city: cities.first)

# # Job.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne", :question1 => "This is a first question", :question2 => "Second question", :question3 => "adfadsfasd")
# # Job.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne", :question1 => "This is a first question", :question2 => "Second question", :question3 => "adfadsfasd")
# # Job.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne", :question1 => "This is a first question", :question2 => "Second question", :question3 => "adfadsfasd")
# # Job.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne", :question1 => "This is a first question", :question2 => "Second question", :question3 => "adfadsfasd")
# # Job.create(:title => "Software engineer", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Melbourne", :question1 => "This is a first question", :question2 => "Second question", :question3 => "adfadsfasd")
# # Job.create(:title => "Life", :description => "good stuff", :country => "Australia", :city => "Perth") 

# u = User.create(:first_name => "Yash", email: "4s56sdsd7a8sdfsd@gmail.com", password: "123456", :city => "Sydney")
# u.company = Company.new(:title => "Facebook", :abn => "12345678")
# u.company.save
# s = SubIndustry.create(name: "IT")
# u.jobs.create(:title => "IT Staff", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Sydney", sub_industry_id: s.id, :work_type => "FT")

# User.create(:first_name => "Yash", email: "4567a8sdfsd@gmail.com", password: "123456", :city => "Sydney")
# u.company = Company.new(:title => "Wunderman", :abn => "12345678")
# u.company.save
# s = SubIndustry.create(name: "IT")
# u.jobs.create(:title => "IT Staff", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Sydney", sub_industry_id: s.id, :work_type => "FT")




# u = User.create(:first_name => "Yash", email: "4ssd5sdf6a7890@gmail.com", password: "123456", :city => "Canberra")
# u.company = Company.new(:title => "Yahoo", :abn => "12345678")
# u.company.save
# s = SubIndustry.create(name: "Data Science")
# u.jobs.create(:title => "Data Sciencetist", :description => "This sis aasdfadsfas", :country => "Australia", :city => "Canberra", sub_industry_id: s.id, :work_type => "PT")




# # ###############
# # #Interviewas
# #  u = User.create(:first_name => "Yash", email: "12sssdsd5asd04@gmail.com", password: "123456", :city => "Sydney")
# #  u.job_seeker = JobSeeker.create(mobile_number: "0416021705")
# #  u = JobSeeker.first
# # c = Company.first
# # first = u.interview_reviews.create(title: "Awesome", company_id: c.id, company_name: c.title, description: "The interview was great", position: "Software developer", experience: "Graduate level", offer:  true, difficulty: 5, duration: 1)
# # second = u.interview_reviews.create(title: "Bad", company_id: c.id, company_name: c.title, description: "The interview was great", position: "Software engineer", experience: "2 years experience", offer:  true, difficulty: 4, duration: 1)
# # third = u.interview_reviews.create(title: "Awesome", company_id: c.id, company_name: c.title, description: "The interview was great", position: "Technological analyst", experience: "Graduate level", offer:  true, difficulty: 5, duration: 1)
# # fourth = u.interview_reviews.create(title: "asdfasd", company_id: c.id, company_name: c.title, description: "The interview was great", position: "Software developer", experience: "Graduate level", offer:  true, difficulty: 10, duration: 1)
# # first = u.interview_reviews.create(title: "Awesome", company_id: 1, company_name: "aCompany", description: "The interview was great", position: "Software developer", experience: "Graduate level", offer:  true, difficulty: 5, duration: 1)
# # second = u.interview_reviews.create(title: "Awesome", company_id: 2, company_name: "bCompany", description: "The interview was great", position: "Software developer", experience: "Graduate level", offer:  true, difficulty: 5, duration: 1)

# # # q = Question.create(:question => "How was your interview expereience ?")
# # # iq.question_id = q.id
# # # iq.save


# # # ###############


# # # ###################

# # # #Review
# # u = User.create(:first_name => "Yash", email: "yash.narwal@gmail.com", password: "123456", :city => "Sydney")
# # u.company = Company.create(abn: "12345679", title: "Google")
# # u.company.save

# # c = Company.last

# # c.reviews.create(title: "This is a review", isAnonymous: true, description: "This is a verry good interviews", company_name: "Google")


# # c.reviews.create(title: "This is a review", isAnonymous: true, description: "This is a verry good interviews", company_name: "Google")


# # c.reviews.create(title: "This is a review", isAnonymous: true, description: "This is a verry good interviews", company_name: "Google")



# # c.reviews.create(title: "This is a review", isAnonymous: true, description: "This is a verry good interviews", company_name: "Microsoft")


# # c.reviews.create(title: "This is a review", isAnonymous: true, description: "This is a verry good interviews", company_name: "Mocrosoft")



# # # ####################


# # # ###################
# # # ##Team member

# # TeamMember.create(name:"Yash", role: "Full stack developer", about: "Great")
# # TeamMember.create(name:"Arjun", role: "Back end developer", about: "Good")
# # TeamMember.create(name:"Steph", role: "Front end developer", about: "Good")
# # TeamMember.create(name:"Grace", role: "Front end developer", about: "Good")
# # TeamMember.create(name:"Tracy", role: "Front end developer", about: "Good")



# # # ######################