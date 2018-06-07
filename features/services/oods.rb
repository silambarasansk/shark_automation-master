# frozen_string_literal: true
class OODSService
  include Singleton

  def initialize
    @port = 4333
    @protocol = Mountebank::Imposter::PROTOCOL_HTTP
    @loan = {}
    initialize_imposter
  end

  def clear
    initialize_imposter
  end

  def stub_loans(loans, status_code=200)
    predicate = Mountebank::Stub::Predicate.new(equals: {path: '/api/loans'})
    response = Mountebank::Stub::HttpResponse.create(status_code, {'Content-Type': 'application/json'}, loans.to_json)
    @imposter.add_stub(response, predicate)
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
