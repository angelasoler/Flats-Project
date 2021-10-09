require 'rails_helper'

describe 'user books property' do
  it 'successfully' do
    property_type = PropertyType.create!(name: 'Apartamento')
    property_owner = PropertyOwner.create!(email: 'john@doe.com.br', password: '123456')
    centro = PropertyLocation.create!(name: 'centro')
    property = Property.create!(title: 'Apartamento Novo',
                                description: 'Um apartamento legal',
                                rooms: 3, bathroom: 2, pets: true, daily_rate: 100,
                                property_type: property_type, property_owner: property_owner, property_location: centro)
    tenant = PropertyTenant.create!(email: 'jane@doe.com.br', password: '123456')

    login_as tenant, scope: :property_tenant
    visit root_path
    click_on property.title
    fill_in 'Data de início', with: '25/10/2021'
    fill_in 'Data de término', with: '31/10/2021'
    fill_in 'Quantidade de pessoas', with: '3'
    click_on 'Enviar Reserva'

    expect(page).to have_content('25/10/2021')
    expect(page).to have_content('31/10/2021')
    expect(page).to have_content(/3/)
    expect(page).to have_content('R$ 400,00')
    expect(page).to have_content('Pedido de reserva enviado com sucesso')
  end
end 