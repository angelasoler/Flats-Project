require 'rails_helper'

describe 'Visitor register property location' do
  it 'successfully' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
    
    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Cadastrar Região Do Imóvel'
    fill_in 'Nome da região do seu imóvel', with: 'Jardim Libano'
    click_on 'Cadastrar'
    
    expect(page).to have_content('Região cadastrada com sucesso!')
    expect(page).to have_content('Cadastro de Imóvel')

  end

  it 'and must fill the field' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
      
    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Cadastrar Região Do Imóvel'
    fill_in 'Nome da região do seu imóvel', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Nome da região do seu imóvel')
  end

  it 'and register and existing location' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
    PropertyLocation.create!(name: 'Jardim Libano')
      
    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Cadastrar Região Do Imóvel'
    fill_in 'Nome da região do seu imóvel', with: 'Jardim Libano'
    click_on 'Cadastrar'

    expect(page).to have_content('Nome já está em uso')
    expect(page).to have_link('Cadastrar Imóvel')
    # add para que nao se repita com variaçoes de downcase e upcase
  end
end