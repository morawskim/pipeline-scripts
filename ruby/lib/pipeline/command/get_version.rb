class GetVersionCommand
  def initialize(git_dir, branch_name, source_branch_name = nil)
    @git_dir = git_dir
    @branch = branch_name
    @source_branch_name = source_branch_name
  end

  def run
    if Branch.is_hotfix_branch?(@branch) || Branch.is_release_branch?(@branch)
      version = VersionHelper.get_version_from_branch_name(@branch)
      return "#{version}-SNAPSHOT"
    elsif Branch.is_develop_branch?(@branch) || Branch.is_feature_branch?(@branch)
      commit = GitUtils.get_last_merge_commit_message(@git_dir)
      last_version = GitUtils.get_version_from_merge_commit(commit)
      version = GitUtils.find_next_minor_release(last_version, @git_dir)
      return "#{version}-DEVELOP"
    elsif (@source_branch_name && !@source_branch_name.empty?) && Branch.is_master_branch?(@branch) && (Branch.is_hotfix_branch?(@source_branch_name) || Branch.is_release_branch?(@source_branch_name))
      version = VersionHelper.get_version_from_branch_name(@source_branch_name)
      return version
    else
      raise Exception.new("Can't get version number for branch '#{@branch}' source_branch_name '#{@source_branch_name}'")
    end
  end
end
