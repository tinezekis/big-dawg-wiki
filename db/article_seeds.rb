Category.destroy_all if Category.any?
Article.destroy_all if Article.any?
Version.destroy_all if Version.any?
Categorization.destroy_all if Categorization.any?

# users = User.all



# ['dog', 'cat', 'chicken', 'rooster', 'rocketship', 'solar-yatch', 'space-poodle', 'small-rodent', 'cat-people', 'roller-coaster'].each do |word|
#   Category.create!(name: word)
# end
# cat = Category.all

# 10.times do
#   a = Article.create!(orig_author: users.sample,
#                       title: Faker::Commerce.color)
#   (rand(5)+1).times do
#   v = Version.create!(updating_author: users.sample,
#                   article: a,
#                   content: Faker::Company.bs,
#                   footnotes: Faker::Company.catch_phrase)

#   Categorization.create!(version: v,
#                          category: cat.sample)
#   end
# end
