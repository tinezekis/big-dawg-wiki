Category.destroy_all if Category.any?
Article.destroy_all if Article.any?
Version.destroy_all if Version.any?
Categorization.destroy_all if Categorization.any?

dogs = Category.create!(name: "Dogs")

pizza = Category.create!(name: "Pizza")

poodle = Article.create!(title: "Poodles are cool",
                          orig_author_id: 1)

poodle01 = Version.create!(updating_author_id: 2,
                            article: poodle,
                            content: "first dog on the moon",
                            footnotes: "a very reputible source",
                            is_most_recent: false,
                            is_published: false)

Categorization.create!(category: dogs,
                        version: poodle01)

# poodle01.categories << dogs
# poodle01.save!
