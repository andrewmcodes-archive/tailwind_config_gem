# frozen_string_literal: true

require "thor"

module TailwindConfig
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc "version", "tailwind_config version"
    def version
      require_relative "version"
      puts "v#{TailwindConfig::VERSION}"
    end
    map %w[--version -v] => :version

    desc "parse [CONFIG_FILE] [OUTPUT_FILE]", "Command description..."
    method_option :help,
      aliases: "-h",
      type: :boolean,
      desc: "Display usage information"
    def parse(config_file = "tailwind.config.js", output_file = "config/tailwind.config.json")
      if options[:help]
        invoke :help, ["parse"]
      else
        require_relative "commands/parse"
        TailwindConfig::Commands::Parse.new(config_file, output_file, options).execute
      end
    end
  end
end
