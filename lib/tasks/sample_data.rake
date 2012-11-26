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

    SuSi1 = Supplysite.create!(site_id: S1.id, supply_quantity: 20)

    SuSi2 = Supplysite.create!(site_id: S2.id, supply_quantity: 25)

    SuSi3 = Supplysite.create!(site_id: S3.id, supply_quantity: 21)

    DeSi1 = Demandsite.create!(site_id: S4.id, demand_quantity: 15)

    DeSi2 = Demandsite.create!(site_id: S5.id, demand_quantity: 17)

    DeSi3 = Demandsite.create!(site_id: S6.id, demand_quantity: 22)

    DeSi4 = Demandsite.create!(site_id: S7.id, demand_quantity: 12)

    TraLi1 =  Translink.create!(supplysite_id: SuSi1.id, demandsite_id: DeSi1.id, unit_cost: 6)
    TraLi2 =  Translink.create!(supplysite_id: SuSi1.id, demandsite_id: DeSi2.id, unit_cost: 2)
    TraLi3 =  Translink.create!(supplysite_id: SuSi1.id, demandsite_id: DeSi3.id, unit_cost: 6)
    TraLi4 =  Translink.create!(supplysite_id: SuSi1.id, demandsite_id: DeSi4.id, unit_cost: 7)
    TraLi5 =  Translink.create!(supplysite_id: SuSi2.id, demandsite_id: DeSi1.id, unit_cost: 4)
    TraLi6 =  Translink.create!(supplysite_id: SuSi2.id, demandsite_id: DeSi2.id, unit_cost: 9)
    TraLi7 =  Translink.create!(supplysite_id: SuSi2.id, demandsite_id: DeSi3.id, unit_cost: 5)
    TraLi8 =  Translink.create!(supplysite_id: SuSi2.id, demandsite_id: DeSi4.id, unit_cost: 3)
    TraLi9 =  Translink.create!(supplysite_id: SuSi3.id, demandsite_id: DeSi1.id, unit_cost: 8)
    TraLi10 = Translink.create!(supplysite_id: SuSi3.id, demandsite_id: DeSi2.id, unit_cost: 8)
    TraLi11 = Translink.create!(supplysite_id: SuSi3.id, demandsite_id: DeSi3.id, unit_cost: 1)
    TraLi12 = Translink.create!(supplysite_id: SuSi3.id, demandsite_id: DeSi4.id, unit_cost: 6)


  end
end