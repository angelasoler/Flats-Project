require 'rails_helper'
#pode ser apagadp `type: :model` , pois ele identifiva automaticamente pela pasta
RSpec.describe Property, type: :model do
  context 'validations' do
    it 'title must be present' do
      # setup
      property = Property.new
      #act
      property.valid?
      #validation
      expect(property.errors.full_messages_for(:title)).to include('Título não pode ficar em branco')
      #teardown
    end
    it 'description must be present' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:description)).to include('Descrição não pode ficar em branco')
    end
    it 'rooms must be present' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:rooms)).to include('Quartos não pode ficar em branco')
    end
    it 'bathroom must be present' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:bathroom)).to include('Banheiros não pode ficar em branco')
    end
    it 'daily rate must be present' do
      property = Property.new
      property.valid?
      expect(property.errors.full_messages_for(:daily_rate)).to include('Diária não pode ficar em branco')
    end
  end
end
