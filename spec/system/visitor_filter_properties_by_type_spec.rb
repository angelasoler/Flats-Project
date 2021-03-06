require 'rails_helper'

describe 'visitor filter properties by type' do
  it 'using links on homepage' do
    PropertyType.create!(name: 'Apartamento')
    PropertyType.create!(name: 'Casa')
    PropertyType.create!(name: 'Sítio')

    visit root_path

    expect(page).to have_link('Apartamento')
    expect(page).to have_link('Casa')
    expect(page).to have_link('Sítio')
  end

  it 'sucessfully' do
    casa = PropertyType.create!(name:'Casa')
    apartamento = PropertyType.create!(name:'apartamento')
    copacabana = PropertyLocation.create!(name: 'Copacabana')
    centro = PropertyLocation.create!(name: 'Centro')
    proprietário = PropertyOwner.create!(email: 'bla@mail.com', password: '123456')
    
    Property.create!({title:'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3,  parking_slot: true, bathroom: 2, pets: true, daily_rate: 500,
                      property_type: casa, property_location: copacabana, property_owner: proprietário
                      })

    Property.create!({title: 'Cobertura no centro', 
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, parking_slot: false,bathroom: 1, pets: true, daily_rate: 300,
                      property_type: apartamento, property_location: centro, property_owner: proprietário
                      })

    visit root_path
    click_on 'Casa'
    
    expect(page).to have_css('h1', text: 'Imóveis do tipo Casa')
    expect(page).to have_content('Casa com quintal em Copacabana')
    expect(page).not_to have_content('Cobertura no centro')
  end
end
