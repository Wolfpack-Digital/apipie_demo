# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TodoTasksController, type: :request do
  let!(:user) { User.create(email: "test_#{Time.now.to_i}@test.com", password: SecureRandom.hex) }

  before do
    3.times { TodoTask.create(title: 'Test', description: 'Lorem ipsum', user: user) }
  end

  describe 'GET /api/v1/todo_tasks' do
    context 'when logged in' do
      before do
        stub_current_user(user)
        get '/api/v1/todo_tasks', headers: authorized_headers
      end

      it "returns users's todo tasks", :show_in_doc, doc_title: 'Get all todo tasks' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'no authorization token' do
      before do
        get '/api/v1/todo_tasks', headers: default_headers
      end

      it 'returns unauthorized', :show_in_doc, doc_title: 'Unauthorized request' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'POST /api/v1/todo_tasks' do
    context 'when logged in' do
      before do
        stub_current_user(user)
        post '/api/v1/todo_tasks', params: {
          todo_task: {
            title: 'Title',
            description: 'Hello there'
          }
        }.to_json, headers: authorized_headers
      end

      it 'creates a new todo tasks', :show_in_doc, doc_title: 'Create a new todo task' do
        expect(response).to have_http_status(:created)
      end
    end
  end
end
