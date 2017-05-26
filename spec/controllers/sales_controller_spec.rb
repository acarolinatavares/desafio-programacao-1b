require 'spec_helper'
require 'rails_helper'

RSpec.describe SalesController, type: :controller do
  describe 'GET index' do
    it 'must import sales ' do
      sale = FactoryGirl.create(:sale)
      get :index
      expect(assigns(:sales)).to include(sale)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

  end

  describe 'POST create' do
    it 'should import the sales correctly' do
      @file = fixture_file_upload('dados.txt', 'text/txt')
      post :create, attachment: @file
      expect(Sale.any?).to be_truthy
      expect(flash[:notice]).to be_eql('Vendas importadas com sucesso!')
    end
  end
end