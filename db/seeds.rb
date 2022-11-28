puts "Destroying Users, Roles, Stages and Candidates, respectively."
Question.destroy_all
Interview.destroy_all
Candidate.destroy_all
Stage.destroy_all
Role.destroy_all
User.destroy_all
puts "Destroying data - DONE."

puts "Creating users..."
User.create!(
  email: "mo@teamsinta.com", password: "lalala", first_name: "Mo",
  last_name: "Shegow", position: "Recruiter", department: "Recruitment", photo: 'https://avatars.githubusercontent.com/u/114022804?v=4'
)
User.create!(
  email: "tash@teamsinta.com", password: "lalala", first_name: "Tash",
  last_name: "Cruz", position: "Software Engineer", department: "Engineering", photo: 'https://avatars.githubusercontent.com/u/13973128?v=4'
)
User.create!(
  email: "sammy@teamsinta.com", password: "lalala", first_name: "Sammy",
  last_name: "Kavanaugh", position: "Product Manager", department: "Engineering", photo: 'https://avatars.githubusercontent.com/u/113871255?v=4'
)
User.create!(
  email: "tom@teamsinta.com", password: "lalala", first_name: "Tom",
  last_name: "Price", position: "Project Manager", department: "Engineering", photo: 'https://avatars.githubusercontent.com/u/91389023?v=4'
)
puts "Added #{User.all.count} users."

puts "Adding Roles in the system..."
Role.create!(
  title: "Sales Engineer",
  description: "Generating high-quality sales leads, following up after initial contact, securing and renewing orders.",
  user_id: User.first.id
)
Role.create!(
  title: "Front-End Developer",
  description: "Bachelor's degree with 3 years of experience. 1 year rich application experience with HTML, CSS and JS",
  user_id: User.first.id
)
puts "Added #{Role.all.count} roles."

# puts 'Adding stages for the Sales Engineer role...'
# Stage.create!(name: "Screening", role: Role.first)
# Stage.create!(name: "Operational Interview", role: Role.first)
# Stage.create!(name: "Behavioral Interview", role: Role.first)
# Stage.create!(name: "Final Interview", role: Role.first)

# puts 'Adding stages for the Front-End Engineer role...'
# Stage.create!(name: "Screening", role: Role.last)
# Stage.create!(name: "Technical Interview", role: Role.last)
# Stage.create!(name: "Pair Programming", role: Role.last)
# Stage.create!(name: "CEO Interview", role: Role.last)
# Stage.create!(name: "Final Interview", role: Role.last)
# puts "Added #{Stage.all.count} stages in the system."

puts 'Adding candidates for the Sales Engineering position...'
# In the first stage
Candidate.create!(
  first_name: "Keita", last_name: "Wilson", status: 'accepted', profile: 'https://www.indeed.jobs/',
  stage: Stage.first
)
Candidate.create!(
  first_name: "Sunny", last_name: "Liu", status: 'accepted', profile: 'https://www.indeed.jobs/',
  stage: Stage.first
)
Candidate.create!(
  first_name: "Yulia", last_name: "Naumenko", status: 'pending', profile: 'https://www.indeed.jobs/',
  stage: Stage.first
)
# Second stage
Candidate.create!(
  first_name: "Keita", last_name: "Wilson", status: 'accepted', profile: 'https://www.indeed.jobs/',
  stage: Stage.first(2)[1]
)
Candidate.create!(
  first_name: "Sunny", last_name: "Liu", status: 'pending', profile: 'https://www.indeed.jobs/',
  stage: Stage.first(2)[1]
)
# Third stage
Candidate.create!(
  first_name: "Keita", last_name: "Wilson", status: 'pending', profile: 'https://www.indeed.jobs/',
  stage: Stage.first(3)[2]
)
puts "Added #{Candidate.all.count} candidates in the system."

puts "Adding interviews..."
Interview.create!(
  user: User.first, candidate: Candidate.find_by(first_name: "Keita"),
  stage: Stage.first, rating: 4,
  feedback: "Great sales experience. Highly motivated. Personable",
  date: DateTime.new(2022, 12, 20, 16, 30)
)
Interview.create!(
  user: User.last, candidate: Candidate.find_by(first_name: "Sunny"),
  stage: Stage.first, rating: 3,
  feedback: "Fresh grad with Marketing degree. Seems eager to learn.",
  date: DateTime.new(2022, 12, 22, 16, 30)
)
Interview.create!(
  user: User.first, candidate: Candidate.find_by(first_name: "Keita"),
  stage: Stage.first(2)[1], rating: 5,
  feedback: "Extensive sales experience with AWS that is highly transferable to ABC company.",
  date: DateTime.new(2022, 12, 19, 16, 30)
)
puts "Added #{Interview.all.count} interviews."

# puts "Addings questions for the Stages..."
# Question.create!(
#   stage: Stage.first,
#   description: "Could you tell me something about yourself?"
# )
# Question.create!(
#   stage: Stage.first,
#   description: "Could you tell me about your responsibilities in your current/previous role?"
# )
# Question.create!(
#   stage: Stage.first,
#   description: "Why do you want to leave your current position?"
# )
# Question.create!(
#   stage: Stage.first(2)[1],
#   description: "How do you meet deadlines under pressure?"
# )
# Question.create!(
#   stage: Stage.first(2)[1],
#   description: "How did you manage to achieve something while in conflict with a client?"
# )
# Question.create!(
#   stage: Stage.first(2)[1],
#   description: "Why do you want to be a part of our team?"
# )
