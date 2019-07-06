require 'branch'

class VersionHelper

  def self.get_version_from_branch_name(branch_name)
    if Branch.is_release_branch?(branch_name) || Branch.is_hotfix_branch?(branch_name)
      return branch_name.match(/(\d+\.\d+\.\d+)$/)[1]
    end

    raise ArgumentError.new("Can't get version from branch #{branch_name}")
  end

  def self.bump_minor_version(version)
    version_chunks = version.split('.').map {|number| Integer(number)}

    version_chunks[1] += 1
    version_chunks[2] = 0

    return version_chunks.join('.')
  end
end
