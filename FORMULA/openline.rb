class Openline < Formula
    desc "Everything you need to get started with Openline"
    homepage "https://openline.ai/docs"
    url "https://openline.sh/openline-v0.4.3-f136c4b-linux-arm.tar.xz"
    license "Apache-2.0"

    # to get the latest SHA:
    # find latest release: aws s3api list-objects --bucket openline.sh
    # download release: aws s3 cp [s3:// address of tarball] . 
    # get sha: shasum -a 256 [filename]
  
    sha256 "93e829ed12dfbe3ef644c86036b9d899d2bb702da58f99b59310e90e25a02849"

    def install
        inreplace "bin/openline", /^CLIENT_HOME=/, "export OPENLINE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
        libexec.install Dir["*"]
        bin.install_symlink libexec/"bin/openline"
    end

    def caveats; <<-EOS
        This tool may be used as a standalone CLI to interface with the Openline suite
        
    EOS
    end
end