require 'rails_helper'

describe 'Visitor register property type' do
  it 'successfully' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
    
    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Cadastrar Tipo De Imóvel'
    fill_in 'Nome do tipo do seu imóvel', with: 'casa'
    click_on 'Cadastrar'
    
    expect(page).to have_content('Tipo de imóvel cadastrado com sucesso!')
    expect(page).to have_content('Cadastro de Imóvel')

  end

  it 'and must fill the field' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
      
    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Cadastrar Tipo De Imóvel'
    fill_in 'Nome do tipo do seu imóvel', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Nome do tipo do seu imóvel')
  end

  it 'and register and exisiting type' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
    PropertyType.create!(name: 'Casa')
      
    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Cadastrar Tipo De Imóvel'
    fill_in 'Digite o tipo do seu imóvel', with: 'Casa'
    click_on 'Cadastrar'

    expect(page).to have_content('Esse tipo de imóvel já exite')
    expect(page).to have_content('Cadastro de Imóvel')
  end
end