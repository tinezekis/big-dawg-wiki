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

a5v1 = Version.create!(article: a5, updating_author: a5.orig_author, content: "#Sections & Paragraphs\nWe create titles to sections by adding a hash (pound symbol) to the beginning of a line. That entire line will become the title of our section, so you must hit enter at the end of your section title. If you include section titles, they will appear in the table of contents for your article along with links to jump straight to each section.\nWe create a new paragraph by hitting enter as well.\n#Bold Text\nWe achieve *bold* text by adding an *asterisk* before and after *the text we intend to make bold*.\nAs you may have guessed, we can make just *one* word bold, or we can *make an entire phrase, sentence, or paragraph* bold.\n#Italic Text\nWe can also _italicize_ words by adding an _underscore_ before and after _the text we intend to display in italics_.", is_most_recent: true, is_published: true)
