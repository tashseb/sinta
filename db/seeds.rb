puts "Destroying Question, Interview, Candidate, StageInterviewer, Stage, Role and User, respectively."
Question.destroy_all
Interview.destroy_all
Candidate.destroy_all
StageInterviewer.destroy_all
Stage.destroy_all
Role.destroy_all
User.destroy_all
puts "Destroying data - DONE."

puts "Creating users..."
mo = User.create!(
  email: "mo@sintaapp.com", password: "lalala", first_name: "Mo",
  last_name: "Shegow", position: "Recruiter", department: "Recruitment", photo: 'https://avatars.githubusercontent.com/u/114022804?v=4'
)
tash = User.create!(
  email: "tash@sintaapp.com", password: "lalala", first_name: "Tash",
  last_name: "Cruz", position: "Software Engineer", department: "Engineering", photo: 'https://avatars.githubusercontent.com/u/13973128?v=4'
)
sammy = User.create!(
  email: "sammy@sintaapp.com", password: "lalala", first_name: "Sammy",
  last_name: "Kavanaugh", position: "Product Manager", department: "Engineering", photo: 'https://avatars.githubusercontent.com/u/113871255?v=4'
)
tom = User.create!(
  email: "tom@sintaapp.com", password: "lalala", first_name: "Tom",
  last_name: "Price", position: "Project Manager", department: "Engineering", photo: 'https://avatars.githubusercontent.com/u/91389023?v=4'
)
doug = User.create!(
  email: "doug@sintaapp.com", password: "lalala", first_name: "Doug",
  last_name: "Berkley", position: "Recruitment Manager", department: "Human Resources", photo: 'https://avatars.githubusercontent.com/u/25542223?v=4'
)
trouni = User.create!(
  email: "trouni@sintaapp.com", password: "lalala", first_name: "Trouni",
  last_name: "Tiet", position: "CEO", department: "Administration", photo: 'https://avatars.githubusercontent.com/u/34345789?v=4'
)
ayanori = User.create!(
  email: "ayanori@sintaapp.com", password: "lalala", first_name: "Ayanori",
  last_name: "Toyoda", position: "Senior Engineer", department: "Engineering", photo: 'https://avatars.githubusercontent.com/u/77108453?v=4'
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
Role.create!(
  title: "Back-End Developer",
  description: "Responsible for creating and maintaining technology at the back end of a website (the server, database).",
  user_id: User.first.id
)
Role.create!(
  title: "Software Engineer",
  description: "Design, develop, and test software and applications for computers while ensuring system's performance.",
  user_id: User.first.id
)
Role.create!(
  title: "DevOps Engineer",
  description: "Experience and knowlodge with Python, Ruby, Python, Java, Javascript, PHP, Bash, Shell and Node. js.",
  user_id: User.first.id
)
Role.create!(
  title: "Project Manager",
  description: "Create and lead the team and monitor project progress, deadlines, budget and system performance",
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
# First stage (Screening) of Sales Engineer
mattias = Candidate.create!(
  first_name: "Mattias", last_name: "Welamsson", profile: 'https://www.linkedin.com/in/mattias-welamsson',
  stage: Stage.first
)
soren = Candidate.create!(
  first_name: "Soren", last_name: "Umstot", profile: 'https://www.linkedin.com/in/soren-umstot',
  stage: Stage.first
)
# Second stage (Technical)
joyce = Candidate.create!(
  first_name: "Joyce", last_name: "Chan", profile: 'https://www.linkedin.com/in/joycehwchan',
  stage: Stage.second
)
puts 'Adding candidate for Front-End Engineer'
# First stage (Screening)
savi = Candidate.create!(
  first_name: "Savi", last_name: "Wewala", profile: 'https://www.linkedin.com/in/savithri-wewala-507308a1',
  stage: Stage.fourth
)
# Second stage (Technical)
clement = Candidate.create!(
  first_name: "Clement", last_name: "Choi", profile: 'https://www.linkedin.com/in/clement-choi-5212a213a/',
  stage: Stage.fifth
)
# Third stage (Pair-Programming)
patrick = Candidate.create!(
  first_name: "Patrick", last_name: "Stark", profile: 'https://www.linkedin.com/in/patrick-stark/',
  stage: Role.second.stages.third
)
puts 'Adding candidate for Back-End Engineer'
# First stage (Screening)
yulia = Candidate.create!(
  first_name: "Yuliia", last_name: "Naumenko", profile: 'https://www.linkedin.com/in/yuliia-naumenko-bba121119/',
  stage: Stage.fourth
)
# Second stage (Technical)
ayhem = Candidate.create!(
  first_name: "Ayhem", last_name: "Chet", profile: 'https://www.linkedin.com/in/al5311245/',
  stage: Stage.fifth
)
# Third stage (Pair-Programming)
sho = Candidate.create!(
  first_name: "Sho", last_name: "Fujiwara", profile: 'https://www.linkedin.com/in/sho-fujiwara-a747b520a/',
  stage: Role.second.stages.third
)
patrik = Candidate.create!(
  first_name: "Patrik", last_name: "Moledo", profile: 'https://www.linkedin.com/in/patrik-moledo-0449641a0/',
  stage: Role.second.stages.third
)
puts "Added #{Candidate.all.count} candidates in the system."


puts "Adding Interviewer to some stages of a role"
# Sales Engineer
StageInterviewer.create!(
  user: mo,
  stage: mattias.stage
)
# Soren's interview result is still pending
StageInterviewer.create!(
  user: mo,
  stage: soren.stage
)
StageInterviewer.create!(
  user: ayanori,
  stage: joyce.stage
)
# Front-End
StageInterviewer.create!(
  user: sammy,
  stage: savi.stage
)
StageInterviewer.create!(
  user: tash,
  stage: clement.stage
)
StageInterviewer.create!(
  user: ayanori,
  stage: patrick.stage
)

puts "Adding interviews..."
# Sales Engineer
Interview.create!(
  user: mo, candidate: mattias,
  stage: mattias.stage, rating: 3,
  feedback: "Great sales experience. Highly motivated. Personable",
  date: DateTime.new(2022, 11, 29, 16, 30),
  status: 'accepted'
)
Interview.create!(
  user: mo, candidate: soren,
  stage: soren.stage,
  date: DateTime.new(2022, 12, 1, 13, 30)
)
Interview.create!(
  user: ayanori, candidate: joyce,
  stage: joyce.stage, rating: 4,
  feedback: "Extensive technical skills. Had several internship with big IT companies.",
  date: DateTime.new(2022, 11, 28, 16, 30),
  status: 'accepted'
)
# Front-End Developer
Interview.create!(
  user: sammy, candidate: savi,
  stage: savi.stage,
  date: DateTime.new(2022, 12, 1, 11, 30)
)
Interview.create!(
  user: tash, candidate: clement,
  stage: clement.stage,
  date: DateTime.new(2022, 12, 1, 11, 30)
)
Interview.create!(
  user: ayanori, candidate: patrick,
  stage: patrick.stage, rating: 4,
  feedback: "Well versed with HTML, CSS, and JS. Clean and professional design.",
  date: DateTime.new(2022, 12, 1, 10, 30),
  status: 'accepted'
)

puts "Added #{Interview.all.count} interviews."
# something
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
