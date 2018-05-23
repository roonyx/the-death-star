# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Upwork
# ------
#

# Create Fake users
JSON.parse(ENV['upwork_users']).each do |user|
  email, password = user.split(' & ')
  next if Upwork::User.where(email: email).exists?

  Upwork::User.create(email: email, password: password)
  puts " -- #{email} created"
end

# Create Search requests
%w[python javascript rails ruby angular].each do |query|
  unless Upwork::SearchQuery.where(q: query).exists?
    sq = Upwork::SearchQuery.create(q: query)
    puts " -- SearchQuery<q: #{sq.q}> created"
  end
end
