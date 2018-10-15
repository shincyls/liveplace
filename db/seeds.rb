# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Countries
Country.create!([
    {name: "Malaysia", code: "MY"}
])

# Create States
state = CS.get :MY
state.each do |index, value|
    State.create(name: value, code: index, address: "#{value}, Malaysia", country_id: 1)
end

# Create Cities
State.all.each do |s|
    count = 1
    city = CS.cities(s.code, s.country.code)

    city.each do |c|
        if s.name != "Kuala Lumpur"
            City.create(name: c, code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id)
        else
            City.create!([
                {name: "Ampang", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Bukit Bintang", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Bukit Jalil", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Cheras", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Titiwangsa", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Setiawangsa", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Wangsa Maju", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Batu Caves", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Kepong", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Segambut", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Lembah Pantai", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Seputeh", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id},
                {name: "Bandar Tun Razak", code: "#{s.code}-#{count}", address: "#{c}, #{s.address}", state_id: s.id}
            ])
        end
        count += 1
    end
end



