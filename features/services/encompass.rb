# frozen_string_literal: true
class EncompassService
  include Singleton

  def initialize
    @port = 3333
    @protocol = Mountebank::Imposter::PROTOCOL_HTTP
    @loan = {}
    initialize_imposter
  end

  def clear
    initialize_imposter
  end

  def save
    @loan.each do |loan_number, data|
      predicate = Mountebank::Stub::Predicate.new(equals: {path: "/loans/#{loan_number}"})
      response = Mountebank::Stub::HttpResponse.create(200, {'Content-Type': 'application/json'}, data.to_json)
      @imposter.add_stub(response, predicate)
    end
    @imposter.save!
  end

  private

  def initialize_imposter
    @imposter = Mountebank::Imposter.build(@port, @protocol)
  end
end
