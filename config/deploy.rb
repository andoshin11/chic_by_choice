# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "chic_by_choice"

set :deploy_to, "/var/www/chic_by_choice"

# レポジトリ設定
set :repo_url, 'git@github.com:andoshin11/chic_by_choice.git'
# シンボリックリンクにするディレクトリ
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'node_modules')
# デプロイ先でのソースのバージョンの保持数
set :keep_releases, 5
# コマンド実行時にsudoをつけるか
set :use_sudo, false

set :rbenv_ruby, '2.3.1'

set :bundle_without, %w(development test).join(' ')

set :unicorn_options, '-p 3000'

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create Database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :finished, :cleanup

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  after 'deploy:publishing', 'deploy:restart'
end
