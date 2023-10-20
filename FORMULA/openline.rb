class Openline < Formula
    desc "Everything you need to get started with Openline"
    homepage "https://openline.ai/docs"
    license "Apache-2.0"
    url "http://openline.sh/channels/stable/openline-darwin-arm64.tar.gz"
   
    # to get the latest SHA:
    # find latest release: aws s3api list-objects --bucket openline.sh
    # download release: aws s3 cp [s3:// address of tarball] . 
    # get sha: shasum -a 256 [filename]
  
    sha256 "676f20cd8ff8ea33bf51b1ab4748b8928041a546d751eb2dc1f534853c850938"
    
    depends_on "colima"
    depends_on "docker"
    depends_on "git"
    depends_on "helm"
    depends_on "kubectl"

    def install
        inreplace "bin/openline", /^CLIENT_HOME=/, "export OPENLINE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
        libexec.install Dir["*"]
        bin.install_symlink libexec/"bin/openline"
    end

end
