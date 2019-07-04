require 'regex_constants'

RSpec.describe RegexConstants, "Check branch name" do
  context "feature" do
    it "should match with issue number" do
      expect('feature-123').to match(RegexConstants::BRANCH_NAME_REGEX)
    end

    it "should match with jira issue number" do
      expect('feature-PRO-123').to match(RegexConstants::BRANCH_NAME_REGEX)
    end

    it "should NOT match without issue number" do
      expect('feature-').to_not match(RegexConstants::BRANCH_NAME_REGEX)
    end
  end

  context "release" do
    it "should match with version" do
      expect('release-1.2.3').to match(RegexConstants::BRANCH_NAME_REGEX)
    end

    it "should NOT match without version" do
      expect('release-').to_not match(RegexConstants::BRANCH_NAME_REGEX)
    end

    it "should NOT match without incomplete version" do
      expect('release-1.2').to_not match(RegexConstants::BRANCH_NAME_REGEX)
    end
  end

  context "hotfix" do
    it "should match with version" do
      expect('hotfix-1.2.3').to match(RegexConstants::BRANCH_NAME_REGEX)
    end

    it "should NOT match without version" do
      expect('hotfix-').to_not match(RegexConstants::BRANCH_NAME_REGEX)
    end

    it "should NOT match without incomplete version" do
      expect('hotfix-1.2').to_not match(RegexConstants::BRANCH_NAME_REGEX)
    end
  end

  it "master" do
    expect('master').to match(RegexConstants::BRANCH_NAME_REGEX)
  end

  it "develop" do
    expect('develop').to match(RegexConstants::BRANCH_NAME_REGEX)
  end

  it "strange branch name" do
    expect('8745').to_not match(RegexConstants::BRANCH_NAME_REGEX)
  end
end

RSpec.describe RegexConstants, "Check commit message" do
  it "should accept with hash and issue number" do
    expect('#123 Commit subject').to match(RegexConstants::COMMIT_TITLE_REGEX)
  end

  it "should NOT accept if commit not start with #" do
    expect('123 Commit subject').to_not match(RegexConstants::COMMIT_TITLE_REGEX)
  end

  it "should NOT accept if commit contain only issue number" do
    expect('#123').to_not match(RegexConstants::COMMIT_TITLE_REGEX)
  end
end
