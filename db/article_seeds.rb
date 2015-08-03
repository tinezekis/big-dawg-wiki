Category.destroy_all if Category.any?
Article.destroy_all if Article.any?
Version.destroy_all if Version.any?
Categorization.destroy_all if Categorization.any?

users = User.all

dogs = Category.create!(name: "Dogs")

pizza = Category.create!(name: "Pizza")

poodle = Article.create!(title: "Poodles are cool",
                          orig_author_id: users.sample.id)

poodle01 = Version.create!(updating_author_id: users.sample.id,
                            article: poodle,
                            content: "first dog on the moon",
                            footnotes: "a very reputible source",
                            is_most_recent: false,
                            is_published: false)

Categorization.create!(category: dogs,
                        version: poodle01)

10.times do
  Category.create!(name: Faker::Lorem.word)
end
cat = Category.all

10.times do
  a = Article.create!(orig_author: users.sample,
                      title: Faker::Commerce.color)
  (rand(5)+1).times do
  v = Version.create!(updating_author: users.sample,
                  article: a,
                  content: Faker::Company.bs,
                  footnotes: Faker::Company.catch_phrase)

  Categorization.create!(version: v,
                         category: cat.sample)
  end
end
