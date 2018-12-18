require 'rails_helper'

RSpec.describe 'Questions API', type: :request do
  # initialize test data
  # add questions owner
  let(:user) { create(:user) }
  let(:answer) { create(:answer) }

  let!(:questions) { create_list(:question, 10, user_id: user.id) }
  let(:question_id) { questions.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /questions
  describe 'GET /questions' do
    # make HTTP get request before each example
    before { get '/questions' }

    it 'returns questions' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

    # Test suite for GET /questions?sort=pending_first
  describe 'GET /questions?sort=pending_first' do
    # make HTTP get request before each example
    before { get '/questions?sort=pending_first' }

    it 'returns questions' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

      # Test suite for GET /questions?sort=pending_first
  # describe 'GET /questions?sort=pending_first' do
  #   # make HTTP get request before each example
  #   before { get '/questions?sort=pending_first' }

  #   it 'returns questions' do
  #     # Note `json` is a custom helper to parse JSON responses
  #     expect(json).not_to be_empty
  #     expect(json.size).to eq(10)
  #   end

  #   it 'returns status code 200' do
  #     expect(response).to have_http_status(200)
  #   end
  # end

  # Test suite for GET /questions/:id
  describe 'GET /questions/:id' do
    before { get "/questions/#{question_id}" }

    context 'when the record exists' do
      it 'returns the question' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(question_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:question_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Question/)
      end
    end
  end

  # Test suite for POST /questions
  describe 'POST /questions' do
    # valid question
    let(:valid_attributes) do
      # send json payload
      { title: 'Learn Ruby?', description: 'a simple question', user_id: user.id.to_s }.to_json
    end

    context 'when the request is valid' do
      before { post '/questions', params: valid_attributes, headers: headers }

      it 'creates a question' do
        expect(json['title']).to eq('Learn Ruby?')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post '/questions', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /questions/:id
  describe 'PUT /questions/:id' do
    let(:valid_attributes) { { title: 'What language use for shopping cart app?' }.to_json }

    context 'when the record exists' do
      before { put "/questions/#{question_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

    # Test suite for PUT /questions/:id/resolve
  describe 'PUT /questions/:id/resolve' do
    let(:valid_attributes) { { satus: true, answer_id:answer.id }.to_json }

    context 'when the record exists' do
      before { put "/questions/#{question_id}/resolve", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end




  # Test suite for DELETE /questions/:id
  describe 'DELETE /questions/:id' do
    before { delete "/questions/#{question_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end