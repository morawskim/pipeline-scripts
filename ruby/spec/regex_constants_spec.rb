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

  it "should accept single quote or double quote" do
      expect('#99 - \'single quote\' "dobule quote" ').to match(RegexConstants::COMMIT_TITLE_REGEX)
  end

  it "should accept merge request commit" do
    expect("Merge branch 'hotfix-0.1.1' into 'master'").to match(RegexConstants::COMMIT_TITLE_REGEX)
  end

  it "should allow dot char in commit title" do
    expect("#62 - przeniesienie polecen z .gitlab-ci.yml do package.json").to match(RegexConstants::COMMIT_TITLE_REGEX)
  end

  it "should allow plus sign" do
    expect("#66 - deploy minio + instrukcja").to match(RegexConstants::COMMIT_TITLE_REGEX)
  end

  it "should allow for digits in commit title" do
      expect('#67 - test e2e upload obrazka do minio').to match(RegexConstants::COMMIT_TITLE_REGEX)
  end

  it "should allow for merge commit if target branch is not inside quotes" do
      expect("Merge branch 'master' into develop").to match(RegexConstants::COMMIT_TITLE_REGEX)
  end

  it "should allow parentheses in commit subject" do
      expect("#47 - budowanie w procesie CI dokumentacji API (swagger-ui)").to match(RegexConstants::COMMIT_TITLE_REGEX)
  end

  it "should allow for & sign in commit subject" do
      expect("#127 - formularz profilu zbudowany w oparciu o formik & react-async").to match(RegexConstants::COMMIT_TITLE_REGEX)
  end

  it "should allow for colon in commit subject" do
      expect("#25 TS: strict mode").to match(RegexConstants::COMMIT_TITLE_REGEX)
  end
end
