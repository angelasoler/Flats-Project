require 'rails_helper'

describe 'Visitor log in' do
  context 'as property owner'  do
    it 'successfully' do
      jane = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

      visit_root_path
      click_on 'Entrar'
      fill_in 'Email', with: jane.email
      fill_in 'Senha', with: jane.password
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_content('Login efetuado com sucesso!')
      expect(page).to have_content(jane.email)
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Entrar')
      expect(page).to have_link('Cadastar Imóvel')
    end

    it 'and logs out' do
      jane = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

      login_as jane, scope: :property_owner
      visit root_path
      click_on 'Logout'
      
      expect(page).to have_content('Saiu com sucesso')
      expect(page).to_not have_content(jane.email)
      expect(page).to_not have_link('Logout')
      expect(page).to have_content('Entrar')
      expect(page).to_not have_link('Cadastrar Imóvel')
    end

    it 'and create an account' do
      
      visit root_path
      click_on 'Crear Conta'
      fill_in 'E-mail', with: 'fakemail@fake.com'
      fill_in  'Senha', with: '123456'
      fill_in 'Confirme seu senha', with: '123456'
      click_on 'Enviar'

      expect(page).to have_content('Conta cadastrada com sucesso!!')
      expect(page).to have_link('Cadastrar Imóvel')
      expect(page).to have_content('fakemail@fake.com')
      expect(page).not_to have_link('Entrar')
      # email, senha e confirmação de senha
    end
    
    context 'as user' do
      
    end
end
