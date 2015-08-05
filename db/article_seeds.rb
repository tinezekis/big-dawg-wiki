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

sectioned_article = Article.create!(title: "This Article Has Sections", orig_author: users.sample)

sectioned_article_version_1 = Version.create!(article: sectioned_article, updating_author: sectioned_article.orig_author, content: "This is the first version of the article.\nIt's not much to look at.", is_most_recent: false, is_published: true)

sectioned_article_version_2 = Version.create!(article: sectioned_article, updating_author: users.sample, content: "#First Section\nHere's a paragraph about some stuff.\n#Another Section\nHere's another paragraph.\n#Section the Last\nHere's more content.\nAnd here's a final paragraph.", footnotes: "I got this information somewhere", is_most_recent: true, is_published: true)

Categorization.create!(category: dogs,
                        version: poodle01)

['dog', 'cat', 'chicken', 'rooster', 'rocketship', 'solar-yatch', 'space-poodle', 'small-rodent', 'cat-people', 'roller-coaster'].each do |word| 
  Category.create!(name: word)
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
