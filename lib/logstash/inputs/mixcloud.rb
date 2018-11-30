require 'logstash/inputs/base'
require 'stud/interval'
require 'socket'
require_relative 'data_fetcher'

MIXCLOUD_API_URL = 'https://api.mixcloud.com/'

class LogStash::Inputs::Mixcloud < LogStash::Inputs::Base
  include LogStash::Inputs::DataFetcher

  config_name 'mixcloud'

  default :codec, 'plain'

  config :message, validate: :string, default: 'Hello World!'
  config :interval, validate: :number, default: 60
  config :type_popular, validate: :string, defailt: 'popular'
  # could be popular popular/hot new

  def register
    @host = Socket.gethostname
  end

  def message
    @message = popular_songs(MIXCLOUD_API_URL, @type_popular)
    @message
  end

  def run(queue)
    # we can abort the loop if stop? becomes true
    until stop?
      event = LogStash::Event.new('message' => message, 'host' => @host)
      decorate(event)
      queue << event
      sleep @interval
      Stud.stoppable_sleep(@interval) { stop? }
    end
  end
end
