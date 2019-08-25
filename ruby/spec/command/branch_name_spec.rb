require 'pipeline'

RSpec.describe BranchName, "Check branch name" do
  it "for release branch" do
    command = BranchName.new('release-3.5.78')
    expect(command.run).to eq true
  end

  it "for master branch" do
    command = BranchName.new('master')
    expect(command.run).to eq true
  end

  it "for develop branch" do
    command = BranchName.new('develop')
    expect(command.run).to eq true
  end

  it "for feature branch" do
    command = BranchName.new('feature-PRO-158')
    expect(command.run).to eq true
  end

  it "for feature branch only issue number" do
    command = BranchName.new('feature-158')
    expect(command.run).to eq true
  end

  it "for hotfix branch" do
    command = BranchName.new('hotfix-1.2.3')
    expect(command.run).to eq true
  end

  it "for wrong branch name" do
    command = BranchName.new('example')
    expect(command.run).to eq false
  end
end
