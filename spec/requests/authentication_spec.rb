require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # Authentication test suite
  describe 'POST /sessions' do
    # create test user
    let!(:user) { create(:user) }
    # set headers for authorization
    let(:headers) { valid_headers.except('X-QA-Key') }
    # set test valid and invalid credentials
    let(:valid_credentials) do
      {
        username: user.username,
        password: user.password
      }.to_json
    end
    let(:invalid_credentials) do
      {
        username: Faker::Internet.username,
        password: Faker::Internet.password
      }.to_json
    end

    # set request.headers to our custon headers
    # before { allow(request).to receive(:headers).and_return(headers) }

    # returns auth token when request is valid
    context 'When request is valid' do
      before { post '/sessions', params: valid_credentials, headers: headers }

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    # returns failure message when request is invalid
    context 'When request is invalid' do
      before { post '/sessions', params: invalid_credentials, headers: headers }

      it 'returns a failure message' do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end