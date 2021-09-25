require 'rails_helper'

describe 'Visitor register property'
  it 'successfully' do
    #Arrange

    #Act
    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Titulo', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto do UFSC'
    fill_in 'Quartos', with: '3'
    fill_in 'Diária', with: 200
    fill_in 'Banheiros', with: '2'
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
  end
end
