require 'sinatra'
require 'mysql2'
require 'sinatra/reloader'
#tasks = [
#  {
#    title: 'dev front end',
#    createdAt: Time.now
#  },{
#    title: 'dev back end',
#    createdAt: Time.now
#  }
#]

get '/' do
  'hello world!'
end


get '/api/hello' do
  {
    message: 'hello world!'
  }.to_json
end

get '/api/tasks' do
  client = connect
  result = client.query('select id, title, created_at from tasks;')
  tasks = result.map do |row|
    {
      id: row['id'],
      title: row['title'],
      createdAt: row['created_at']
    }
  end
  {
    tasks: tasks
  }.to_json
end

post '/api/tasks' do
  request_body = JSON.parse request.body.read
  #logger.info request_body
  #task = {
  #  title: request_body['title'],
  #  createdAt: Time.now
  #}
  #tasks.push task
  client = connect
  title = request_body['title']
  statement = client.prepare('INSERT INTO tasks (title) values (?);')
  statement.execute(title)
  #task.to_json
  client.close()
end

def connect
  Mysql2::Client.new(
    :host => 'mysql',
    :database => 'mydb',
    :username => 'myuser',
    :password => 'password',
    :connect => 5
  )
end
