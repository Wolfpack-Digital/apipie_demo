module Api::V1::TodoTasksControllerDoc
  extend Apipie::DSL::Concern

  def_param_group :authorization do
    header 'Bearer Token', 'oauth2 access token', required: true
    error code: 401, desc: 'Unauthorized'
  end

  api :GET, '/v1/todo_tasks', 'get todo tasks'
  param_group :authorization
  def index; end

  api :POST, '/v1/todo_tasks', 'create new todo task'
  param_group :authorization
  param :todo_task, Hash do
    param :title, String
    param :description, String
  end
  def create; end
end
