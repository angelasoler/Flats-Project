require 'rails_helper'

describe 'Visitor visit homepage' do
  it 'and view properties' do
    property_type = PropertyType.create!(name:'Casa')
    property_location = PropertyLocation.create!(name: 'Copacabana')
    property_owner = PropertyOwner.create!(email: 'Angela@DonaDoImovel.com', password: '1234564')
    Property.create!({title:'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3,  parking_slot: true, bathroom: 2, pets: true, daily_rate: 500,
                      property_type: property_type, property_location: property_location, property_owner: property_owner
                      })

    Property.create!({title: 'Cobertura em Manaus', 
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, parking_slot: false,bathroom: 1, pets: true, daily_rate: 300,
                      property_type: property_type, property_location: property_location, property_owner: property_owner
                      })

    visit root_path

    expect(page).to have_content('Casa com quintal em Copacabana')
    expect(page).to have_content('Excelente casa, recém reformada com 2 vagas de garagem')
    expect(page).to have_content('Quartos: 3')
    expect(page).to have_content('Cobertura em Manaus')
    expect(page).to have_content('Cobertura de 300m2, churrasqueira e sauna privativa')
    expect(page).to have_content('Quartos: 5')
  end

  it 'and theres no property available' do
    #Act => Agir (executar a funcionalidade)
    visit root_path

    expect(page).to have_content("Nenhum imóvel disponível")
  end

  it 'and view property details' do
    #Arrange => Preparar (os dados)
    property_type = PropertyType.create!(name:'Casa')
    property_location = PropertyLocation.create!(name: 'Copacabana')
    property_owner = PropertyOwner.create!(email: 'Angela@DonaDoImovel.com', password: '1234564')
    Property.create!({ title: 'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, parking_slot: true, bathroom: 2, pets: true, daily_rate: 500,
                      property_type: property_type, property_location: property_location, property_owner: property_owner
                    })

    visit root_path
    #Assert => Garanti
    click_on 'Casa com quintal em Copacabana'

    expect(page).to have_content("Casa com quintal em Copacabana")
    expect(page).to have_content("Excelente casa, recém reformada com 2 vagas de garagem")
    expect(page).to have_content("Quartos: 3")
    expect(page).to have_content("Banheiros: 2")
    expect(page).to have_content("Aceita Pets: Sim")
    expect(page).to have_content("Estacionamento: Sim")
    expect(page).to have_content("Diária: R$ 500,00")
  end
   
  it 'and view property details and return to homepage' do
    property_type = PropertyType.create!(name:'Casa')
    property_location = PropertyLocation.create!(name: 'Copacabana')
    property_owner = PropertyOwner.create!(email: 'AngelA@DonaDoImovel.com', password: '1234564')
    Property.create!({ title: 'Casa com quintal em Copacabana', 
                                 description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                                 rooms: 3, parking_slot: true, bathroom: 2, pets: true, daily_rate: 500,
                                 property_type: property_type, property_location: property_location, property_owner: property_owner
                               })
    Property.create!({ title: 'Cobertura em Manaus', 
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, parking_slot: false, bathroom: 1, pets: true, daily_rate: 300, 
                      property_type: property_type, property_location: property_location, property_owner: property_owner
                    })
    #Act => Agir (executar a funcionalidade)
    visit root_path
    click_on 'Casa com quintal em Copacabana'
    click_on 'Voltar'

    #Assert => Garantir (que algo aconteceu ou NAO aconteceu)
    expect(current_path).to eq root_path
    expect(page).to have_content('Casa com quintal em Copacabana')
    expect(page).to have_content('Cobertura em Manaus')
  end
end