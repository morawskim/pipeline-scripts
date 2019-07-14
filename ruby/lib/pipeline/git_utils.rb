class GitUtils
  def self.get_last_merge_commit_message(git_dir)
    repo = Rugged::Repository.new(git_dir)
    walker = Rugged::Walker.new(repo)
    walker.sorting(Rugged::SORT_TOPO)
    walker.push(repo.head.target.oid)

    merge_commit = nil
    walker.each do |c|
      if c.parent_ids.length > 1 && c.summary =~ /release|hotfix/
        merge_commit = c
        break
      end
    end

    return nil if merge_commit.nil?
    return merge_commit.summary
  end

  def self.get_version_from_merge_commit(message)
    return message.match(/.*(release-|hotfix-)(\d+\.\d+\.\d+).*/)[2]
  end

  def self.release_branch_exists?(version, git_dir)
    repo = Rugged::Repository.new(git_dir)
    repo.branches.each_name(:remote).include? "origin/release-#{version}"
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
