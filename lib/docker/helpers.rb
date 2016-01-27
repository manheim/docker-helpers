require "docker/helpers/version"
require 'json'

module Docker
  module Helpers
    class << self
      def output_stream
        lambda { |v|
          body, should_output = should_output?(v)
          if should_output
            $stdout.puts body["stream"]
          end
        }
      end

      private
      def should_output?( string )
        parsed = JSON.parse(string)
        worth_showing = parsed && parsed.has_key?("stream") && ENV['DEBUG']

        [parsed, worth_showing]
      end
    end
  end
end
