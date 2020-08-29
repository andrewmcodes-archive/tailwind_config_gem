RSpec.describe "`tailwind_config parse` command", type: :cli do
  it "executes `tailwind_config help parse` command successfully" do
    output = `tailwind_config help parse`
    expected_output = <<~OUT
      Usage:
        tailwind_config parse [CONFIG_FILE] [OUTPUT_FILE]
      
      Options:
        -h, [--help], [--no-help]  # Display usage information
      
      Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
