require 'rails_helper'

describe 'Visitor log in' do
  context 'as property owner'  do
    it 'successfully' do
      jane = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')

      visit root_path
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
      expect(page).to have_link('Cadastrar Imóvel')
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
      click_on 'Quero publicar um imóvel'
      fill_in 'Email', with: 'fakemail@fake.com'
      fill_in  'Senha', with: '123456'
      fill_in 'Confirmação de senha', with: '123456'
      click_on 'Criar Conta'

      expect(page).to have_content('Conta cadastrada com sucesso!!')
      expect(page).to have_link('Cadastrar Imóvel')
      expect(page).to have_content('fakemail@fake.com')
      expect(page).not_to have_link('Entrar')
      # email, senha e confirmação de senha
    end
  end
    
  context 'as user/property tenant' do
    it 'successfully' do
      luis = PropertyTenant.create!(email: 'luis@doe.com.br', password: '123456789')

      visit root_path
      click_on 'Quero alugar um imóvel'
      fill_in 'Email', with: luis.email
      fill_in 'Senha', with: luis.password
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_content('Login efetuado com sucesso!')
      expect(page).to have_content(luis.email)
      expect(page).to have_link('Logout')
      expect(page).not_to have_link('Entrar')
      expect(page).to have_link('Ver imóveis por região')
    end

    it 'and logs out' do
      luis = PropertyTenant.create!(email: 'luis@doe.com.br', password: '123456789')

      login_as jane, scope: :property_tenant
      visit root_path
      click_on 'Logout'
      
      expect(page).to have_content('Saiu com sucesso')
      expect(page).to_not have_content(luis.email)
      expect(page).to_not have_link('Logout')
      expect(page).to have_content('Entrar')
      expect(page).to_not have_link('Cadastrar Imóvel')
    end

    it 'and create an account' do
      
      visit root_path
      click_on 'Quero alugar um imóvel'
      fill_in 'Email', with: 'fakemail@fake.com'
      fill_in  'Senha', with: '123456'
      fill_in 'Confirmação de senha', with: '123456'
      click_on 'Criar Conta'

      expect(page).to have_content('Conta cadastrada com sucesso!!')
      expect(page).to have_link('Cadastrar Imóvel')
      expect(page).to have_content('fakemail@fake.com')
      expect(page).not_to have_link('Entrar')
      # email, senha e confirmação de senha
    end
  end
end
