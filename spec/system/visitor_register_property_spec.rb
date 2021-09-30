require 'rails_helper'

describe 'Visitor register property' do

  it 'successfully' do
    #Arrange
    PropertyType.create!(name: 'casa')
    #Act
    visit root_path
    click_on 'Cadastrar Imóvel'

    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto do UFSC'
    fill_in 'Quartos', with: '3'
    fill_in 'Diária', with: 200
    fill_in 'Banheiros', with: '2'
    select 'Casa', from: 'Tipo'
    check  'Aceita Pets'
    check 'Vaga de Estacionamento'

    click_on 'Enviar'

    #Assert
    expect(page).to have_content('Casa em Florianópolis')
    expect(page).to have_content('Ótima casa perto do UFSC')
    expect(page).to have_content('Quartos: 3')
    expect(page).to have_content('Banheiros: 2') 
    expect(page).to have_content('Aceita Pets: Sim')
    expect(page).to have_content('Estacionamneto: Sim')
    expect(page).to have_content('Diária: R$ 200,00')
    expect(page).to have_content("Tipo: Casa")
  end

  it 'and must fill all fields' do
    visit root_path

    click_on 'Cadastrar Imóvel'
    click_on 'Enviar'

    expect(page).to have_content('Todos campos devem ser preenchidos', count: 5)
    # expect(page).to have_content('Título não pode ficar em branco')
    # expect(page).to have_content('Descrição não pode ficar em branco')
    # expect(page).to have_content('Quartos não pode ficar em branco')
    # expect(page).to have_content('Banheiros não pode ficar em branco')
    # expect(page).to have_content('Diária não pode ficar em branco')
    expect(Property.count).to eq(0)
  end

  # it 'and bathroom, daily_rate and rooms fields are numeric' do
  #   visit root_path

  #   click_on 'Cadastrar Imóvel'
  #   click_on 'Enviar'

  #   expect(bathroom, rooms, daily_rate).to be_an(integer)
  #   expect(Property.count).to eq(0)
  # end

  # it 'and bathroom, daily_rate and rooms fields are greater than zero' do
  #   visit root_path

  #   click_on 'Cadastrar Imóvel'
  #   click_on 'Enviar'

  #   expect(bathroom, rooms, daily_rate).to be(> 0)
  #   expect(Property.count).to eq(0)
  # end

end
