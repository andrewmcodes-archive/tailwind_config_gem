require "spec_helper"

RSpec.describe TailwindConfig do
  subject(:version) { TailwindConfig::VERSION }

  it { expect(version).not_to be nil }
end
