users = User.all

a1 = Article.create!(title: Faker::Company.catch_phrase, orig_author: users.sample)
a2 = Article.create!(title: Faker::Company.catch_phrase, orig_author: users.sample)
a3 = Article.create!(title: Faker::Company.catch_phrase, orig_author: users.sample)
a4 = Article.create!(title: Faker::Company.catch_phrase, orig_author: users.sample)
a5 = Article.create!(title: "Markdown Examples", orig_author: users.sample)

def generate_content
  content = ''
  5.times do
    content << ("\#" + Faker::Company.name + "\n" + Faker::Lorem.paragraph + "\n" + Faker::Lorem.paragraph + "\n")
  end
  content
end
created_categories = []
created_categories << Category.create(name:"music")
created_categories << Category.create(name:"pizza")
created_categories << Category.create(name:"kittens")
created_categories << Category.create(name:"justice")
created_categories << Category.create(name:"space cats")
created_categories << Category.create(name:"tacos")
created_categories << Category.create(name:"priceless gems")
created_categories << Category.create(name:"Ancient Rome")
created_categories << Category.create(name:"waterslides")

a1v1 = Version.create!(article: a1, updating_author: a1.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a1v2 = Version.create!(article: a1, updating_author: a1.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a1v3 = Version.create!(article: a1, updating_author: a1.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a1v4 = Version.create!(article: a1, updating_author: a1.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: true, is_published: true)

a2v1 = Version.create!(article: a2, updating_author: a2.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a2v2 = Version.create!(article: a2, updating_author: a2.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a2v3 = Version.create!(article: a2, updating_author: a2.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a2v4 = Version.create!(article: a2, updating_author: a2.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: true, is_published: true)

a3v1 = Version.create!(article: a3, updating_author: a3.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a3v2 = Version.create!(article: a3, updating_author: a3.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a3v3 = Version.create!(article: a3, updating_author: a3.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a3v4 = Version.create!(article: a3, updating_author: users.sample, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: true, is_published: true)

a4v1 = Version.create!(article: a4, updating_author: a4.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a4v2 = Version.create!(article: a4, updating_author: a4.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a4v3 = Version.create!(article: a4, updating_author: a4.orig_author, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: false, is_published: true)
a4v4 = Version.create!(article: a4, updating_author: users.sample, content: generate_content, footnotes: Faker::Lorem.sentence, is_most_recent: true, is_published: true)

a5v1 = Version.create!(article: a5, updating_author: a5.orig_author, content: "#Sections & Paragraphs\nWe create titles to sections by adding a hash (pound symbol) to the beginning of a line. That entire line will become the title of our section, so you must hit enter at the end of your section title. If you include section titles, they will appear in the table of contents for your article along with links to jump straight to each section.\nWe create a new paragraph by hitting enter as well.\n#Bold Text\nWe achieve *bold* text by adding an *asterisk* before and after *the text we intend to make bold*.\nAs you may have guessed, we can make just *one* word bold, or we can *make an entire phrase, sentence, or paragraph* bold.\n#Italic Text\nWe can also _italicize_ words by adding an _underscore_ before and after _the text we intend to display in italics_.\nJust like with bold, we can put just _one_ word in italics, or _we can italicize a full phrase, sentence, or paragraph_.\n#Some Fun Stuff\nYou can make bold just *O*ne *L*etter of a w*o*rd, as long as you indicate it by surrounding the letter with an asteris*k*. The same can be done with italic_s_, using your underscores appropriately.\nYou can also mark your text as both *_bold and italics_* by using both indicators around the same text!", is_most_recent: true, is_published: true)


sectioned_article = Article.create!(title: "This Article Has Sections", orig_author: users.sample)

sectioned_article_version_1 = Version.create!(article: sectioned_article, updating_author: sectioned_article.orig_author, content: "This is the first version of the article.\nIt's not much to look at.", is_most_recent: false, is_published: true)

sectioned_article_version_2 = Version.create!(article: sectioned_article, updating_author: users.sample, content: "#First Section\nHere's a paragraph about some stuff.\n#Another Section\nHere's another paragraph.\n#Section the Last\nHere's more content.\nAnd here's a final paragraph.", footnotes: "I got this information somewhere", is_most_recent: true, is_published: true)


all_versions = Version.all

all_versions.each do |ver|
  ver.categories << created_categories.sample(4)
end
