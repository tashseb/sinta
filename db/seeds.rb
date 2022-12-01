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
  last_name: "Kavanagh", position: "Product Manager", department: "Engineering", photo: 'https://avatars.githubusercontent.com/u/113871255?v=4'
)
User.create!(
  email: "tom@sintaapp.com", password: "lalala", first_name: "Tom",
  last_name: "Price", position: "Project Manager", department: "Engineering", photo: 'https://avatars.githubusercontent.com/u/91389023?v=4'
)
User.create!(
  email: "doug@sintaapp.com", password: "lalala", first_name: "Doug",
  last_name: "Berkley", position: "Recruitment Manager", department: "Human Resources", photo: 'https://avatars.githubusercontent.com/u/25542223?v=4'
)
User.create!(
  email: "trouni@sintaapp.com", password: "lalala", first_name: "Trouni",
  last_name: "Tiet", position: "CEO", department: "Administration", photo: 'https://avatars.githubusercontent.com/u/34345789?v=4'
)
ayanori = User.create!(
  email: "ayanori@sintaapp.com", password: "lalala", first_name: "Ayanori",
  last_name: "Toyoda", position: "Senior Engineer", department: "Engineering", photo: 'https://avatars.githubusercontent.com/u/77108453?v=4'
)

puts "Added #{User.all.count} users."

puts "Adding Roles in the system..."
sales = Role.create!(
  title: "Sales Engineer",
  description: "Generating high-quality sales leads, following up after initial contact, securing and renewing orders.",
  user_id: User.first.id
)
front = Role.create!(
  title: "Front-End Developer",
  description: "Bachelor's degree with 3 years of experience. 1 year rich application experience with HTML, CSS and JS",
  user_id: User.first.id
)
back = Role.create!(
  title: "Back-End Developer",
  description: "Responsible for creating and maintaining technology at the back end of a website (the server, database).",
  user_id: User.first.id
)
software = Role.create!(
  title: "Software Engineer",
  description: "Design, develop, and test software and applications for computers while ensuring system's performance.",
  user_id: User.first.id
)
dev = Role.create!(
  title: "DevOps Engineer",
  description: "Experience and knowlodge with Python, Ruby, Python, Java, Javascript, PHP, Bash, Shell and Node. js.",
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
  stage: sales.stages.first
)
soren = Candidate.create!(
  first_name: "Soren", last_name: "Umstot", profile: 'https://www.linkedin.com/in/soren-umstot',
  stage: sales.stages.first
)
# Second stage (Technical)
joyce = Candidate.create!(
  first_name: "Joyce", last_name: "Chan", profile: 'https://www.linkedin.com/in/joycehwchan',
  stage: sales.stages.second
)
puts 'Adding candidate for Front-End Engineer'
# First stage (Screening)
savi = Candidate.create!(
  first_name: "Savi", last_name: "Wewala", profile: 'https://www.linkedin.com/in/savithri-wewala-507308a1',
  stage: front.stages.first
)
# Second stage (Technical)
clement = Candidate.create!(
  first_name: "Clement", last_name: "Choi", profile: 'https://www.linkedin.com/in/clement-choi-5212a213a/',
  stage: front.stages.second
)
# Third stage (Pair-Programming)
patrick = Candidate.create!(
  first_name: "Patrick", last_name: "Stark", profile: 'https://www.linkedin.com/in/patrick-stark/',
  stage: front.stages.third
)
puts 'Adding candidate for Back-End Engineer'
# First stage (Screening)
yulia = Candidate.create!(
  first_name: "Yuliia", last_name: "Naumenko", profile: 'https://www.linkedin.com/in/yuliia-naumenko-bba121119/',
  stage: back.stages.first
)
# Second stage (Technical)
ayhem = Candidate.create!(
  first_name: "Ayhem", last_name: "Chet", profile: 'https://www.linkedin.com/in/al5311245/',
  stage: back.stages.first
)
# Third stage (Pair-Programming)
sho = Candidate.create!(
  first_name: "Sho", last_name: "Fujiwara", profile: 'https://www.linkedin.com/in/sho-fujiwara-a747b520a/',
  stage: back.stages.first
)
patrik = Candidate.create!(
  first_name: "Patrik", last_name: "Moledo", profile: 'https://www.linkedin.com/in/patrik-moledo-0449641a0/',
  stage: back.stages.second
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
# Back-End
StageInterviewer.create!(
  user: mo,
  stage: yulia.stage
)
StageInterviewer.create!(
  user: mo,
  stage: ayhem.stage
)
StageInterviewer.create!(
  user: mo,
  stage: sho.stage
)
StageInterviewer.create!(
  user: ayanori,
  stage: patrik.stage
)

puts "Adding interviews..."
# Sales Engineer
Interview.create!(
  user: mo, candidate: mattias,
  stage: mattias.stage, rating: 3,
  feedback: "Great sales experience. Highly motivated. Personable",
  date: DateTime.new(2022, 11, 29, 16, 30),
  status: 'Passed'
)
Interview.create!(

  user: mo, candidate: soren,
  stage: soren.stage, rating: 4,
  feedback: "Over qualified for the role. Better for senior position",
  date: DateTime.new(2022, 12, 1, 13, 30),
  status: 'Failed'
)
Interview.create!(
  user: ayanori, candidate: joyce,
  stage: joyce.stage, rating: 4,
  feedback: "Extensive technical skills. Had several internship with big IT companies.",
  date: DateTime.new(2022, 11, 28, 16, 30),
  status: 'Passed'
)
# Front-End Developer
Interview.create!(
  user: sammy, candidate: savi,
  stage: savi.stage, rating: 4,
  feedback: "Great portfolio. Worked well with others.",
  date: DateTime.new(2022, 11, 29, 11, 30),
  status: 'Passed'
)
Interview.create!(
  user: tash, candidate: clement,
  stage: clement.stage, rating: 4,
  feedback: "Extensive technical skills. Writes clean code.",
  date: DateTime.new(2022, 11, 29, 13, 30),
  status: 'Passed'
)
Interview.create!(
  user: ayanori, candidate: patrick,
  stage: patrick.stage, rating: 4,
  feedback: "Well versed with HTML, CSS, and JS. Clean and professional design.",
  date: DateTime.new(2022, 11, 28, 10, 30),
  status: 'Passed'
)
# Back-End Developer
Interview.create!(
  user: mo, candidate: yulia,
  stage: savi.stage, rating: 4,
  feedback: "Great portfolio. Worked well with others.",
  date: DateTime.new(2022, 11, 24, 11, 30),
  status: 'Passed'
)
Interview.create!(
  user: mo, candidate: ayhem,
  stage: clement.stage, rating: 4,
  feedback: "Extensive technical skills. Writes clean code.",
  date: DateTime.new(2022, 11, 29, 10, 30),
  status: 'Passed'
)
Interview.create!(
  user: mo, candidate: sho,
  stage: patrick.stage, rating: 4,
  feedback: "Well versed with HTML, CSS, and JS. Clean and professional design.",
  date: DateTime.new(2022, 11, 25, 10, 30),
  status: 'Passed'
)
Interview.create!(
  user: ayanori, candidate: patrik,
  stage: patrick.stage, rating: 4,
  feedback: "Well versed with HTML, CSS, and JS. Clean and professional design.",
  date: DateTime.new(2022, 11, 15, 10, 30),
  status: 'Passed'
)
puts "Added #{Interview.all.count} interviews."

BASE_QUESTIONS = {
  "screening" => [
    "Tell us a little about yourself and your interests.?",
    "What interested you in applying for a position at our company?",
    "Why do you want to apply for this position?",
    "Do you have any question?"
  ],
  "technical" => [
    "What is an N+query? Is it good or bad?",
    "Can you make a simple database for Student and Teacher?",
    "What is MVC?",
    "What are the characteristics of an OOP languange?"
  ],
  "pair" => [
    "Get the value of an object and put in an array.",
    "Fizz Buzz exercise",
    "Palindrome exercise",
    "Right triangle challenge using only console.log "
  ],
  "behavioral" => [
    "What makes an ideal coworker in your eyes?",
    "How do you prioritize projects under pressure?",
    "How would handle your schedule when it's interrupted?",
    "Have you ever bent company policy to satisfy a client?"
  ],
  "manager" => [
    "What's your management style?",
    "How do you see a manager's role on a team?",
    "How do you motivate a team?",
    "Tell me about a time you dealt with a difficult employee."
  ],
  "ceo" => [
    "What do you think our company's mission and vision are?",
    "What changes would you implement during your first year in the company?",
    "What would you do in your first 30 days as CEO of our organization?",
    "Who do you believe are our biggest competitors?"
  ]
}
# Adding 4 questions per stage
# Sales Engineering
puts "Addings questions for the Sales Engineering..."
Question.create!(
  stage: sales.stages.first,
  description: BASE_QUESTIONS["screening"][0]
)
Question.create!(
  stage: sales.stages.first,
  description: BASE_QUESTIONS["screening"][1]
)
Question.create!(
  stage: sales.stages.first,
  description: BASE_QUESTIONS["screening"][2]
)
Question.create!(
  stage: sales.stages.first,
  description: BASE_QUESTIONS["screening"][3]
)
Question.create!(
  stage: sales.stages.second,
  description: BASE_QUESTIONS["technical"][0]
)
Question.create!(
  stage: sales.stages.second,
  description: BASE_QUESTIONS["technical"][1]
)
Question.create!(
  stage: sales.stages.second,
  description: BASE_QUESTIONS["technical"][2]
)
Question.create!(
  stage: sales.stages.second,
  description: BASE_QUESTIONS["technical"][3]
)
Question.create!(
  stage: sales.stages.third,
  description: BASE_QUESTIONS["behavioral"][0]
)
Question.create!(
  stage: sales.stages.third,
  description: BASE_QUESTIONS["behavioral"][1]
)
Question.create!(
  stage: sales.stages.third,
  description: BASE_QUESTIONS["behavioral"][2]
)
Question.create!(
  stage: sales.stages.third,
  description: BASE_QUESTIONS["behavioral"][3]
)

# Front
puts "Addings questions for the Front End Developer..."
Question.create!(
  stage: front.stages.first,
  description: BASE_QUESTIONS["screening"][0]
)
Question.create!(
  stage: front.stages.first,
  description: BASE_QUESTIONS["screening"][1]
)
Question.create!(
  stage: front.stages.first,
  description: BASE_QUESTIONS["screening"][2]
)
Question.create!(
  stage: front.stages.first,
  description: BASE_QUESTIONS["screening"][3]
)
Question.create!(
  stage: front.stages.second,
  description: BASE_QUESTIONS["technical"][0]
)
Question.create!(
  stage: front.stages.second,
  description: BASE_QUESTIONS["technical"][1]
)
Question.create!(
  stage: front.stages.second,
  description: BASE_QUESTIONS["technical"][2]
)
Question.create!(
  stage: front.stages.second,
  description: BASE_QUESTIONS["technical"][3]
)
Question.create!(
  stage: front.stages.third,
  description: BASE_QUESTIONS["pair"][0]
)
Question.create!(
  stage: front.stages.third,
  description: BASE_QUESTIONS["pair"][1]
)
Question.create!(
  stage: front.stages.third,
  description: BASE_QUESTIONS["pair"][2]
)
Question.create!(
  stage: front.stages.third,
  description: BASE_QUESTIONS["pair"][3]
)
Question.create!(
  stage: front.stages.fourth,
  description: BASE_QUESTIONS["ceo"][0]
)
Question.create!(
  stage: front.stages.fourth,
  description: BASE_QUESTIONS["ceo"][1]
)
Question.create!(
  stage: front.stages.fourth,
  description: BASE_QUESTIONS["ceo"][2]
)
Question.create!(
  stage: front.stages.fourth,
  description: BASE_QUESTIONS["ceo"][3]
)

# Back End
puts "Addings questions for the Back End..."
Question.create!(
  stage: back.stages.first,
  description: BASE_QUESTIONS["screening"][0]
)
Question.create!(
  stage: back.stages.first,
  description: BASE_QUESTIONS["screening"][1]
)
Question.create!(
  stage: back.stages.first,
  description: BASE_QUESTIONS["screening"][2]
)
Question.create!(
  stage: back.stages.first,
  description: BASE_QUESTIONS["screening"][3]
)
Question.create!(
  stage: back.stages.second,
  description: BASE_QUESTIONS["technical"][0]
)
Question.create!(
  stage: back.stages.second,
  description: BASE_QUESTIONS["technical"][1]
)
Question.create!(
  stage: back.stages.second,
  description: BASE_QUESTIONS["technical"][2]
)
Question.create!(
  stage: back.stages.second,
  description: BASE_QUESTIONS["technical"][3]
)
Question.create!(
  stage: back.stages.third,
  description: BASE_QUESTIONS["pair"][0]
)
Question.create!(
  stage: back.stages.third,
  description: BASE_QUESTIONS["pair"][1]
)
Question.create!(
  stage: back.stages.third,
  description: BASE_QUESTIONS["pair"][2]
)
Question.create!(
  stage: back.stages.third,
  description: BASE_QUESTIONS["pair"][3]
)

# Software Engineering
puts "Addings questions for the Software Engineer..."
Question.create!(
  stage: software.stages.first,
  description: BASE_QUESTIONS["screening"][0]
)
Question.create!(
  stage: software.stages.first,
  description: BASE_QUESTIONS["screening"][1]
)
Question.create!(
  stage: software.stages.first,
  description: BASE_QUESTIONS["screening"][2]
)
Question.create!(
  stage: software.stages.first,
  description: BASE_QUESTIONS["screening"][3]
)
Question.create!(
  stage: software.stages.second,
  description: BASE_QUESTIONS["technical"][0]
)
Question.create!(
  stage: software.stages.second,
  description: BASE_QUESTIONS["technical"][1]
)
Question.create!(
  stage: software.stages.second,
  description: BASE_QUESTIONS["technical"][2]
)
Question.create!(
  stage: software.stages.second,
  description: BASE_QUESTIONS["technical"][3]
)
Question.create!(
  stage: software.stages.third,
  description: BASE_QUESTIONS["pair"][0]
)
Question.create!(
  stage: software.stages.third,
  description: BASE_QUESTIONS["pair"][1]
)
Question.create!(
  stage: software.stages.third,
  description: BASE_QUESTIONS["pair"][2]
)
Question.create!(
  stage: software.stages.third,
  description: BASE_QUESTIONS["pair"][3]
)
Question.create!(
  stage: software.stages.fourth,
  description: BASE_QUESTIONS["manager"][0]
)
Question.create!(
  stage: software.stages.fourth,
  description: BASE_QUESTIONS["manager"][1]
)
Question.create!(
  stage: software.stages.fourth,
  description: BASE_QUESTIONS["manager"][2]
)
Question.create!(
  stage: software.stages.fourth,
  description: BASE_QUESTIONS["manager"][3]
)

# DevOps
puts "Addings questions for the DevOps..."
Question.create!(
  stage: dev.stages.first,
  description: BASE_QUESTIONS["screening"][0]
)
Question.create!(
  stage: dev.stages.first,
  description: BASE_QUESTIONS["screening"][1]
)
Question.create!(
  stage: dev.stages.first,
  description: BASE_QUESTIONS["screening"][2]
)
Question.create!(
  stage: dev.stages.first,
  description: BASE_QUESTIONS["screening"][3]
)
Question.create!(
  stage: dev.stages.second,
  description: BASE_QUESTIONS["technical"][0]
)
Question.create!(
  stage: dev.stages.second,
  description: BASE_QUESTIONS["technical"][1]
)
Question.create!(
  stage: dev.stages.second,
  description: BASE_QUESTIONS["technical"][2]
)
Question.create!(
  stage: dev.stages.second,
  description: BASE_QUESTIONS["technical"][3]
)
Question.create!(
  stage: dev.stages.third,
  description: BASE_QUESTIONS["pair"][0]
)
Question.create!(
  stage: dev.stages.third,
  description: BASE_QUESTIONS["pair"][1]
)
Question.create!(
  stage: dev.stages.third,
  description: BASE_QUESTIONS["pair"][2]
)
Question.create!(
  stage: dev.stages.third,
  description: BASE_QUESTIONS["pair"][3]
)
