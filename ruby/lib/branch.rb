class Branch
  def self.is_master_branch?(branch_name)
    return !!branch_name.match(/^master$/)
  end

  def self.is_develop_branch?(branch_name)
    return !!branch_name.match(/^develop$/)
  end

  def self.is_feature_branch?(branch_name)
    return !!branch_name.match(/^feature-[\w\-]+$/)
  end

  def self.is_release_branch?(branch_name)
    return !!branch_name.match(/^release-\d+\.\d+\.\d+$/)
  end

  def self.is_hotfix_branch?(branch_name)
    return !!branch_name.match(/^hotfix-\d+\.\d+\.\d+$/)
  end
end
