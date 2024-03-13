class Openline < Formula
    desc "Everything you need to get started with Openline"
    homepage "https://openline.ai/docs"
    license "Apache-2.0"
    url "http://openline.sh/channels/stable/openline-darwin-arm64.tar.gz"
   
    # to get the latest SHA:
    # find latest release: aws s3api list-objects --bucket openline.sh
    # download release: aws s3 cp [s3:// address of tarball] . 
    # get sha: shasum -a 256 [filename]
  
    sha256 "1b1f2e3161cfd73c905631cb75d4a4acee81571d9f294ab16ed845ee3875b695"
    
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
