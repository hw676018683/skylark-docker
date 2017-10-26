pidfile    '/var/www/pids/puma.pid'
state_path '/var/www/pids/puma.state'
daemonize  false

threads_count = ENV.fetch('PUMA_MAX_THREADS') { 5 }

threads        threads_count, threads_count
workers        ENV.fetch('PUMA_WEB_CONCURRENCY') { 2 }
worker_timeout ENV.fetch('PUMA_WEB_WORKER_TIMEOUT') { 60 }.to_i

environment ENV.fetch('RAILS_ENV') { 'production' }
port        ENV.fetch('PUMA_PORT') { 3000 }

preload_app!

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
