# encoding: utf-8

ENV['SERVER_HOST'] ||= '127.0.0.1'.freeze

require 'bundler/setup'

require 'support/fake_server'
require 'support/fake_thread_pool'
require 'support/await_helper'

unless ENV['COVERAGE'] == 'no' || RUBY_ENGINE == 'rbx'
  require 'coveralls'
  require 'simplecov'

  if ENV.include?('TRAVIS')
    Coveralls.wear!
    SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  end

  SimpleCov.start do
    add_group 'Source', 'lib'
    add_group 'Unit tests', 'spec/cql'
    add_group 'Integration tests', 'spec/integration'
  end
end

require 'ione'
