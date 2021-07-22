require 'database_cleaner'
require 'rainbow/refinement'
require 'faker'

using Rainbow

Gem.win_platform? ? (system "cls") : (system "clear")

puts "-- Erasing DB --".red

DatabaseCleaner.clean_with(:truncation)

puts "--    Done    --".green

puts "\nSeeding...".yellow

Lecture.create(
  name: "Personnal class (1 hour)"
)

Lecture.create(
  name: "Personnal class (1 hour)"
)

Lecture.create(
  name: "Group class (1 hour)"
)

Lecture.create(
  name: "Intense class (2 hour)"
)

Lecture.create(
  name: "Intense group class (2 hour)"
)

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

puts """\nSeeded:\n" + 
  "#{Lecture.count} ".yellow + "Lectures,\n".green +
  "Demo Users".yellow + " - "+ "Created\n""".green

puts "Let's rock".green