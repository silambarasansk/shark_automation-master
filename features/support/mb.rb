# frozen_string_literal: true
require 'mountebank'

Dir[File.join(__FILE__, '../services/*.rb')].each {|service| require service }

Before do
  encompass_service = EncompassService.instance
  encompass_service.clear
  encompass_service.save

  oods_service = OODSService.instance
  oods_service.clear
  oods_service.save
end
