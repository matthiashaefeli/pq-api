require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'create' do
    it 'returns status 200' do
      request.headers.merge!({ 'Authorization' => 'Bearer ' + user_and_token(GroupsController.new)[0] })
      post :create, params: { 'group': {
                              'title': 'first group',
                              'public': 'true'
                            } }
      res = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(res['title']).to eq('first group')
    end

    it 'returns error if public false and blank password' do
      request.headers.merge!({ 'Authorization' => 'Bearer ' + user_and_token(GroupsController.new)[0] })
      post :create, params: { 'group': {
                              'title': 'first group',
                              'public': 'false'
                            } }
      res = JSON.parse(response.body)
      expect(response.status).to eq 400
      expect(res['error']).to eq(["Password can't be blank"])
    end

    it 'returns error if title blank' do
      request.headers.merge!({ 'Authorization' => 'Bearer ' + user_and_token(GroupsController.new)[0] })
      post :create, params: { 'group': {
                              'title': '',
                              'public': 'true'
                            } }
      res = JSON.parse(response.body)
      expect(response.status).to eq 400
      expect(res['error']).to eq(["Title can't be blank"])
    end
  end
end