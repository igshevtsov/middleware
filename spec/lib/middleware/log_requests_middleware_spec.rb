# frozen_string_literal: true

require 'rails_helper'
require 'rack'
# require_relative '../' # '/Users/igorshev/Documents/Git/middleware/lib/middleware/log_requests_middleware.rb'

RSpec.describe LogRequestsMiddleware do
  let(:env) { Rack::MockRequest.env_for }
  let(:app) { lambda {|env| [200, {'Content-Type' => 'application/json'}, ['OK']]} }
  subject { described_class.new(app) }

  context 'when GET request is submitted' do
    let(:request) { Rack::MockRequest.new(subject) }

    it 'raises the exception' do
      mock = double('Log')
      allow(mock).to receive(:create!)
      expect { subject.call(env) }.to raise_error(JSON::ParserError)
      #expect { subject.call(env) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
