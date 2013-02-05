Fabricator :article do
  title { Faker::Lorem.sentence(5) }
  content { Faker::Lorem.paragraphs(3) }
end