# frozen_string_literal: true

require 'rails_helper'

describe DataUsaClient do

  subject { DataUsaClient.new }

  it 'exists' do
    expect(subject).to be_a(DataUsaClient)
  end

  context 'Instance Methods' do
    it 'can #find_cities' do
      VCR.use_cassette('find_cities') do
        response = subject.find_cities('denver')

        expect(response).to be_a(Hash)
  
        expect(response).to have_key(:data)
        expect(response[:data]).to be_a(Array)
        expect(response[:data][0][0]).to be_a(String)
        expect(response[:data][0][1]).to be_a(String)
        expect(response[:data][0][2]).to be_a(Float)
        expect(response[:data][0][3]).to be_a(String)
        expect(response[:data][0][4]).to be_a(String)
        expect(response[:data][0][5]).to be_a(String)
        expect(response[:data][0][6]).to be_a(Integer)
        expect(response[:data][0][7]).to be_a(String)
      end
    end
  end
end