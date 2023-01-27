class Openline < Formula
    desc "Everything you need to get started with Openline"
    homepage "https://openline.ai/docs"
    license "Apache-2.0"
    url "http://openline.sh/channels/stable/openline-darwin-arm64.tar.gz"
   
    # to get the latest SHA:
    # find latest release: aws s3api list-objects --bucket openline.sh
    # download release: aws s3 cp [s3:// address of tarball] . 
    # get sha: shasum -a 256 [filename]
  
    sha256 "c7bb5cfee0e3ad83e90e5207f7ecadb0c5fa3c699a5be6dc4ee2033fc3fc31bb"
    
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
