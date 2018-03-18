namespace :utils do
  desc "Popular banco de dados"
  task seed: :environment do
    puts "Gerando contatos..."
      100.times do |i|
        Contact.create!(name: Faker::Name.name,
              email: Faker::Internet.email,
              kind: Kind.all.sample,
              rmk: LeroleroGenerator.sentence([1,2,3].sample))
      end
    puts "OK, Contatos Gerados!"
    
    puts "Gerando endereços..."
      Contact.all.each do |contact|
        Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: contact
          )
      end
    puts "OK, Endereços gerados!"
    
    puts "Gerando telefones..."
      Contact.all.each do |contact|
        Random.rand(1..3).times do |i|
          Phone.create!(
            phone: Faker::PhoneNumber.cell_phone,
            contact: contact
          )
        end
      end
    puts "OK, Telefones gerados!"
  end
end
