server '163.44.166.221', roles: %w(web db app)

set :ssh_options, {
  user: 'root',
  port: 22,
  forward_agent: true,
  keys: ['~/.ssh/id_rsa']
}

set :branch, fetch(:branch, 'master')
