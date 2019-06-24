namespace :demo do
  task all: :environment do
    Rake::Task["demo:pages"].invoke
  end

  task pages: :environment do
    puts "Creating pages..."

    [
      ["Accounts", Faker::Markdown.sandwich(6, 3)],
      ["Engineering", Faker::Markdown.sandwich(6, 3)],
      ["Sales", Faker::Markdown.sandwich(6, 3)],
      ["Marketing", Faker::Markdown.sandwich(6, 3)],
      ["User Experience", Faker::Markdown.sandwich(6, 3)],
      ["Operations", Faker::Markdown.sandwich(6, 3)],
    ].each do |title, body|
      parent = Page.create!(title: title, body: body)
      3.times do
        Page.create!(parent: parent, title: Faker::Company.catch_phrase, body: Faker::Markdown.sandwich(6, 3))
      end
    end
  end
end