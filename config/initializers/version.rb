module Motto
  class << self
    def version
      Semver.new(semver)
    end

    def commit_sha
      `git rev-parse HEAD`.chomp
    end

    private

    def semver
      "0.0.1"
    end
  end
end
