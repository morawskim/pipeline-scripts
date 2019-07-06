class GitUtils
  def self.get_last_merge_commit_message(git_dir)
    # TODO error handling
    return `git --git-dir=#{git_dir} --no-pager log --oneline --merges |grep -E 'release|hotfix' | head -1`
  end

  def self.get_version_from_merge_commit(message)
    return message.match(/.*(release-|hotfix-)(\d+\.\d+\.\d+).*/)[2]
  end

  def self.release_branch_exists?(version, git_dir)
    # TODO error handling
    output = `git --git-dir=#{git_dir} branch --remotes |grep release-#{version}`
    return !output.strip.empty?
  end

  def self.find_next_minor_release(version, git_dir)
    loop do
      version = VersionHelper.bump_minor_version(version)
      result = self.release_branch_exists? version, git_dir
      break unless result
    end

    return version
  end
end
