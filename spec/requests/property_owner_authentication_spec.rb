require 'rails_helper'

RSpec.describe 'Property Owner authentication',type: :request do
  it 'cannot create property without login' do
    post '/properties'

    expect(response).to redirect_to(new_property_owner_session_path)
  end

  it 'cannot open new property form unless authenticated' do
    #get '/properties/new'
    get new_property_path

    expect(response).to redirect_to(new_property_owner_session_path)
  end
end

