require 'rails_helper'

describe 'visitor filter properties by location' do
  it 'using links on homepage' do
    PropertyLocation.create!(name: 'Jardim Libano')
    PropertyLocation.create!(name: 'Franco Da Rocha')
    PropertyLocation.create!(name: 'Mariporã')

    visit root_path

    expect(page).to have_link('Jardim Libano')
    expect(page).to have_link('Franco Da Rocha')
    expect(page).to have_link('Mariporã')
  end

  it 'sucessfully' do
    mariporã = PropertyLocation.create!(name:'Mariporã')
    franco_da_rocha = PropertyLocation.create!(name:'Franco Da Rocha')
    casa = PropertyType.create!(name: 'casa')
    cobertura = PropertyType.create!(name: 'cobertura')
    
    Property.create!({title:'Casa com quintal em Mariporã', 
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3,  parking_slot: true, bathroom: 2, pets: true, daily_rate: 500,
                      property_type: casa, property_location: mariporã
                      })

    Property.create!({title: 'Cobertura em Franco Da Rocha', 
                      description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                      rooms: 5, parking_slot: false,bathroom: 1, pets: true, daily_rate: 300,
                      property_type: cobertura, property_location: franco_da_rocha
                      })

    visit root_path
    click_on 'Mariporã'
    
    expect(page).to have_css('h1', text: 'Imóveis em Mariporã')
    expect(page).to have_content('Casa com quintal em Mariporã')
    expect(page).not_to have_content('Cobertura em Franco Da Rocha')
  end

  
end