require 'net/http'

module LogStash
  module Inputs
    module DataFetcher
      def popular_songs(url, _period)
        Net::HTTP.get(URI("#{url}popular/"))
      end
    end
  end
end
