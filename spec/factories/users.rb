FactoryBot.define do
  factory :user, class: User do
    name { 'Some user' }
    email { 'email@email.com' }
    password { 'asdf' }
    password_digest { BCrypt::Password.create('asdf') }
  end

  factory :correcter, class: User do
    name { 'correcter' }
    email { 'c@email.com' }
    password { 'asdf' }
    password_digest { BCrypt::Password.create('asdf') }
  end

  factory :submitter, class: User do
    name { 'submitter' }
    email { 's@email.com' }
    password { 'asdf' }
    password_digest { BCrypt::Password.create('asdf') }
  end
end
