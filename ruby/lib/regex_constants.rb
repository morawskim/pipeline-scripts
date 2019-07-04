class RegexConstants
  BRANCH_NAME_REGEX = /^master|develop|feature-[\w]+|hotfix-\d+\.\d+\.\d+|release-\d+\.\d+\.\d+$/
  COMMIT_TITLE_REGEX = /^#\d+ [\w]+/
end
