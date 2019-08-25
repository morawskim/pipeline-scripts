class CheckCommitTitle
  def initialize(commit_title)
    @commit_title = commit_title
  end

  def run
    RegexConstants::COMMIT_TITLE_REGEX.match?(@commit_title)
  end
end
