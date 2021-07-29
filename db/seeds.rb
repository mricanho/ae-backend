require 'rainbow/refinement'
require 'faker'

using Rainbow

Gem.win_platform? ? (system "cls") : (system "clear")

puts "-- Erasing DB --".red

puts "--    Done    --".green

puts "\nSeeding...".yellow

User.create(
  username: 'demo_admin',
  email: 'demo_admin@email.com',
  admin: true,
  password: '12345678',
  password_confirmation: '12345678',
)
User.create(
  username: 'demo_user',
  email: 'demo_user@email.com',
  password: '12345678',
  password_confirmation: '12345678',
)

group1 = LectureGroup.create(
  shortname: 'Beginner',
  name: 'Begginer level',
  description: 'This level is for the new students, kids and adults',
  img_thumb: 'https://res.cloudinary.com/mricanho/image/upload/v1627577973/Easy%20English/5293_vf09ae.jpg'
)

group2 = LectureGroup.create(
  shortname: 'Intermediate',
  name: 'Intermediate level',
  description: 'This level is for students who already have principles on the language and want to reach the new stage, kids and adults',
  img_thumb: 'https://res.cloudinary.com/mricanho/image/upload/v1627578276/Easy%20English/11070_1_zsb0e1.jpg'
)

group2 = LectureGroup.create(
  shortname: 'Intermediate',
  name: 'Intermediate level',
  description: 'This level is for students who already have principles on the language and want to reach the new stage, kids and adults',
  img_thumb: 'https://res.cloudinary.com/mricanho/image/upload/v1627578276/Easy%20English/11070_1_zsb0e1.jpg'
)

group3 = LectureGroup.create(
  shortname: 'Advanced',
  name: 'Advanced level',
  description: 'This level is for already speakers who need to reach the native stage, kids and adults',
  img_thumb: 'https://res.cloudinary.com/mricanho/image/upload/v1627578513/Easy%20English/10088_1_gb1yna.jpg'
)

Lecture.create(
  name: "Individual Class",
  img_thumb: 'https://res.cloudinary.com/mricanho/image/upload/v1627579035/Easy%20English/20944874_1_sw5c1i.jpg'
)

Lecture.create(
  name: "Group Class",
  img_thumb: 'https://res.cloudinary.com/mricanho/image/upload/v1627579391/Easy%20English/20944706_1_xnlbgk.jpg'
)

puts """\nSeeded:\n" + 
  "#{Lecture.count} ".yellow + "Lectures,\n".green +
  "Demo Users".yellow + " - "+ "Created\n""".green

puts "Let's rock".green