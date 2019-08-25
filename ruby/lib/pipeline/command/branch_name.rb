class BranchName
  def initialize(branch_name)
    @branch = branch_name
  end

  def run
    Branch.is_develop_branch?(@branch) ||
      Branch.is_feature_branch?(@branch) ||
      Branch.is_hotfix_branch?(@branch) ||
      Branch.is_master_branch?(@branch) ||
      Branch.is_release_branch?(@branch)
  end
end
