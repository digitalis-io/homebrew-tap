# Homebrew formula for ansai.
#
# The ansai release workflow rewrites `url` and `sha256` from the tagged source
# tarball on every stable release. Do not edit those two fields by hand;
# everything else is maintained here.
class Ansai < Formula
  desc "Turn a plain-language request into a multi-server Ansible deployment"
  homepage "https://github.com/digitalis-io/ansai"
  url "https://github.com/digitalis-io/ansai/archive/refs/tags/v0.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "Apache-2.0"
  head "https://github.com/digitalis-io/ansai.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"ansai"), "-trimpath", "./cmd/ansai"
    generate_completions_from_executable(bin/"ansai", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ansai --version")
  end
end
