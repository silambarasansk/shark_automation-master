# frozen_string_literal: true
namespace :features do
  Cucumber::Rake::Task.new(:run) do |t|
    t.profile = ENV['PROFILE'] || 'default'
  end
end
