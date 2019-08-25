require 'pipeline'

RSpec.describe CheckCommitTitle, "Check commit title" do
  it "should accept with hash and issue number" do
    command = CheckCommitTitle.new('#123 Commit subject')
    expect(command.run).to eq true
  end

  it "for wrong commit title" do
    command = CheckCommitTitle.new('example')
    expect(command.run).to eq false
  end
end
