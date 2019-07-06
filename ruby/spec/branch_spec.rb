require 'pipeline'

RSpec.describe Branch, "Check branch name" do
  context "feature" do
    it "with issue number" do
      result = Branch.is_feature_branch? 'feature-123'
      expect(result).to be true
    end

    it "with jira issue number" do
      result = Branch.is_feature_branch? 'feature-PRO-123'
      expect(result).to be true
    end

    it "without issue number" do
      result = Branch.is_feature_branch? 'feature'
      expect(result).to be false
    end
  end

  context "release" do
    it "with version" do
      result = Branch.is_release_branch? 'release-1.2.3'
      expect(result).to be true
    end

    it "without version" do
      result = Branch.is_release_branch? 'release'
      expect(result).to be false
    end

    it "with incomplete version" do
      result = Branch.is_release_branch? 'release-1.2'
      expect(result).to be false
    end
  end

  context "hotfix" do
    it "with version" do
      result = Branch.is_hotfix_branch? 'hotfix-1.2.3'
      expect(result).to be true
    end

    it "without version" do
      result = Branch.is_hotfix_branch? 'hotfix'
      expect(result).to be false
    end

    it "with incomplete version" do
      result = Branch.is_hotfix_branch? 'hotfix-1.24'
      expect(result).to be false
    end
  end

  context "master" do
    it "with correct name" do
      result = Branch.is_master_branch? 'master'
      expect(result).to be true
    end

    it "with wrong name" do
      result = Branch.is_master_branch? 'masteer'
      expect(result).to be false
    end
  end

  context "develop" do
    it "with correct name" do
      result = Branch.is_develop_branch? 'develop'
      expect(result).to be true
    end

    it "with wrong develop" do
      result = Branch.is_develop_branch? 'development'
      expect(result).to be false
    end
  end
end
