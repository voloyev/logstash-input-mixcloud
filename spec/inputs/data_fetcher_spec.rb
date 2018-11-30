require 'logstash/devutils/rspec/spec_helper'
require 'logstash/inputs/data_fetcher'

RSpec.describe LogStash::Inputs::DataFetcher do
  let(:dummy_class) { Class.new { include LogStash::Inputs::DataFetcher } }

  it 'Should send request to mixcloud' do
    expect(dummy_class.new
             .popular_songs('http://api.mixcloud.com/',
                            'month')).to be_truthy
  end
end
