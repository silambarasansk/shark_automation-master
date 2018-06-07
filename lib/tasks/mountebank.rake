# frozen_string_literal: true
require 'rest-client'
require 'colorize'

def start_mountebank
  fork do
    exec 'mb --loglevel error'
  end
end

namespace :mb do
  desc 'start mountebank if not running'
  task :start do
    `ps aux | grep bin/mb | grep -v grep | awk '{print $2}' | xargs kill -9`
    puts 'Starting mountebank'.colorize(:green)
    start_mountebank
  end

  task :stop do
    begin
      pid = File.read('mb.pid')
      puts "Stopping mountebank #{pid}".colorize(:green)
      `kill -9 #{pid}`
    rescue
      puts 'Mountebank is not running'.colorize(:yellow)
    end
  end

  task restart: %w(mb:stop mb:start)
end
