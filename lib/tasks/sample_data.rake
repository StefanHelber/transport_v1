#encoding: UTF-8

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end

  task populate: :environment do
    S1 = Site.create!(name: "Frankfurt(M)",
                      codename: "FRA")
    S2 = Site.create!(name: "Berlin-Tegel",
                      codename: "TLX")
    S3 = Site.create!(name: "München",
                      codename: "MUC")
    S4 = Site.create!(name: "Bremen",
                      codename: "BRE")
    S5 = Site.create!(name: "Cottbus",
                      codename: "CBU")
    S6 = Site.create!(name: "Düsseldorf",
                      codename: "DUS")
    S7 = Site.create!(name: "Hamburg",
                      codename: "HAM")
    S8 = Site.create!(name: "Stuttgart",
                      codename: "STR")
  end
end