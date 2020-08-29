# frozen_string_literal: true

require_relative "../command"

module TailwindConfig
  module Commands
    class Parse < TailwindConfig::Command
      def initialize(config_file, output_file, options)
        @config_file = config_file
        @output_file = output_file
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        output.puts "OK"
      end
    end
  end
end
