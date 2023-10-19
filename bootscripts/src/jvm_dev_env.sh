set -eo pipefail

# Right now, sdkman seems to be the best way of boostrapping a good java/jvm dev env. https://sdkman.io/
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install gradle
sdk install maven
sdk install scala
sdk install sbt
sdk install java 20.0.2-tem
sdk install java 8.0.382-tem
