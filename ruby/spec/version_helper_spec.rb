require 'version_helper'

RSpec.describe VersionHelper, "VersionHelper" do
  context "#get_version_from_branch_name" do
    it "branch release" do
      result = VersionHelper.get_version_from_branch_name 'release-3.41.456'
      expect(result).to eq '3.41.456'
    end

    it "branch hotfix" do
      result = VersionHelper.get_version_from_branch_name 'hotfix-3.41.456'
      expect(result).to eq '3.41.456'
    end

    it "other branch" do
      expect {VersionHelper.get_version_from_branch_name 'feature-PRO-1233'}.to raise_error(ArgumentError)
    end
  end

  context "#bump_minor_version" do
    it "set patch to zero" do
      result = VersionHelper.bump_minor_version '1.2.3'
      expect(result).to eq '1.3.0'
    end
  end
end
