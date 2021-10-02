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
    
    Property.create!({title:'Casa com quintal em Copacabana', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3,  parking_slot: true, bathroom: 2, pets: true, daily_rate: 500,
                      property_type: casa
                      })

    Property.create!({title: 'Cobertura em Manaus', 
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, parking_slot: false,bathroom: 1, pets: true, daily_rate: 300,
                      property_type: apartamento
                      })

    visit root_path
    click_on 'Casa'
    
    expect(page).to have_css('h1', text: 'Imóveis do tipo Casa')
    expect(page).to have_content('Casa com quintal em Copacabana')
    expect(page).not_to have_content('Cobertura em Manaus')
  end
end
