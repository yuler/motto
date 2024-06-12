module Motto
  class << self
    def version
      Semver.new(semver)
    end

    def commit_sha
      sha = ENV["COMMIT_SHA"]
      sha = `git rev-parse HEAD`.chomp if Rails.env.development?
      sha
    end

    private

    def semver
      "0.0.1"
    end
  end
end
