# frozen_string_literal: true
Dir[File.join(__FILE__, '../models/*.rb')].each {|model| require model }

World(FactoryGirl::Syntax::Methods)
