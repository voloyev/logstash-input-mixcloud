require 'net/http'

module LogStash
  module Inputs
    module DataFetcher
      def popular_songs(url, type)
        Net::HTTP.get(URI("#{url}#{type}/"))
      end
    end
  end
end
