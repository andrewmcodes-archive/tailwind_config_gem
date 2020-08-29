require "tailwind_config/commands/parse"

RSpec.describe TailwindConfig::Commands::Parse do
  it "executes `parse` command successfully" do
    output = StringIO.new
    config_file = nil
    output_file = nil
    options = {}
    command = TailwindConfig::Commands::Parse.new(config_file, output_file, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
