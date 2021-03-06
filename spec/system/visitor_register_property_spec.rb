require 'rails_helper'

describe 'Visitor register property' do

  it 'successfully' do
    #Arrange
    property_owner = PropertyOwner.create!(email: 'jane@doe.com', password: '123456')
    PropertyType.create!(name: 'Casa')
    PropertyLocation.create!(name: 'UFSC')
    #Act
    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto do UFSC'
    fill_in 'Quartos', with: 3
    fill_in 'Diária', with: 200
    fill_in 'Banheiros', with: 2
    select 'Casa', from: 'Tipo'
    check  'Aceita Pets'
    check 'Estacionamento'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content('Casa em Florianópolis')
    expect(page).to have_content('Ótima casa perto do UFSC')
    expect(page).to have_content('Quartos: 3')
    expect(page).to have_content('Banheiros: 2') 
    expect(page).to have_content('Aceita Pets: Sim')
    expect(page).to have_content('Estacionamento: Sim')
    expect(page).to have_content('Diária: R$ 200,00')
    expect(page).to have_content('Tipo: Casa')
    # expect(page).to have_content('Propretario: Jane')
  end

  it 'and must fill all fields' do
    property_owner = PropertyOwner.create!(email: 'proprietário@mai.com', password: '123456')

    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Enviar'

    expect(page).to have_content('não pode ficar em branco', count: 5)
    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Quartos não pode ficar em branco')
    expect(page).to have_content('Banheiros não pode ficar em branco')
    expect(page).to have_content('Diária não pode ficar em branco')
    expect(Property.count).to eq(0)
  end

  # it 'and bathroom, daily_rate and rooms fields are numeric' do
  #   PropertyType.create!(name: 'Casa')
  #   visit root_path

  #   click_on 'Cadastrar Imóvel'
  #   fill_in 'Título', with: 'Casa em Florianópolis'
  #   fill_in 'Descrição', with: 'Ótima casa perto do UFSC'
  #   fill_in 'Quartos', with: 'dois'
  #   fill_in 'Diária', with: 'duzentos'
  #   fill_in 'Banheiros', with: 'tres'
  #   select 'Casa', from: 'Tipo'
  #   check  'Aceita Pets'
  #   check 'Estacionamento'
  #   click_on 'Enviar'

  #   expect(page).to have_content('não é um número inteiro')
  #   expect(page).to have_css('h1', text: 'Cadastro de Imovel')
  #   expect(Property.count).to eq(0)
  # end

  it 'and bathroom, daily_rate and rooms fields are greater than zero' do
    property_owner = PropertyOwner.create!(email: 'proprietário@mai.com', password: '123456')
    PropertyType.create!(name: 'Casa')
    PropertyLocation.create!(name: 'UFSC')
    
    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto do UFSC'
    fill_in 'Quartos', with: -3
    fill_in 'Diária', with: -200
    fill_in 'Banheiros', with: -3
    select 'Casa', from: 'Tipo'
    check  'Aceita Pets'
    check 'Estacionamento'
    click_on 'Enviar'

    expect(page).to have_content('deve ser maior que 0')
    expect(page).to have_css('h1', text: 'Cadastro de Imóvel')
    expect(Property.count).to eq(0)
  end
end
