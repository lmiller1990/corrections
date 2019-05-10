# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

submitter = User.create({ email: 'submitter@email.com', name: 'submitter', password_digest: 'asdf' })
correcter = User.create({ email: 'correcter@email.com', name: 'correcter', password_digest: 'asdf' })
me = User.create({ email: 'lachlan@email.com', name: 'lachlan', password_digest: 'asdf' })

original_text = "I have visited Niagara Falls last weekend.\nThe woman which works here is from Japan.\nShe’s married with a dentist.\nShe was boring in the class.\nI must to call him immediately. Every students like the teacher.\nAlthough it was raining, but we had the picnic. I enjoyed from the movie."

Post.create({
  original_text: original_text,
  corrected_text: "I visited Niagara Falls last weekend.\nThe woman who works here is from Japan.\nShe’s married to a dentist.\nShe was bored in the class.\nI must call him immediately. Every student likes the teacher.\nAlthough it was raining, we had the picnic. I enjoyed the movie.",
  cost_in_cents: original_text.split.count * 25,
  status: 3,
  user: submitter
})


Post.create({
  original_text: 'I am doing the sport every day.',
  cost_in_cents: 7 * 25,
  user: submitter
})
