require 'pipeline'

RSpec.describe GetVersionCommand, "Get version" do
  it "for release branch" do
    command = GetVersionCommand.new('', 'release-3.5.78')
    expect(command.run).to eq '3.5.78-SNAPSHOT'
  end

  it "for hotfix branch" do
    command = GetVersionCommand.new('', 'hotfix-3.5.78')
    expect(command.run).to eq '3.5.78-SNAPSHOT'
  end

  it "for merge hotfix into master" do
    command = GetVersionCommand.new('', 'master', 'hotfix-3.5.78')
    expect(command.run).to eq '3.5.78'
  end

  it "for merge release into master" do
    command = GetVersionCommand.new('', 'master', 'release-3.5.78')
    expect(command.run).to eq '3.5.78'
  end

  it "for merge develop to master" do
    command = GetVersionCommand.new('', 'master', 'develop')
    expect {command.run}.to raise_error(Exception, /Can't get version number for branch/)
  end
end
