require 'pipeline'

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

  it "should accept utf8 chars" do
      expect('#54 - Gitlab Ci/CD - budowanie obrazów dockera').to match(RegexConstants::COMMIT_TITLE_REGEX)
  end
end
