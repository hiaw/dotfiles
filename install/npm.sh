# Install NPM

brew install nvm

nvm install 5
nvm use 5
nvm alias default 5

# Globally install with npm

packages=(
    bower
    brunch
    cordova
    eslint
    grunt
    gulp
    http-server
    ionic
    ios-deploy
    ios-sim
    js-beautify
    tern
    typings
    hexo-cli
)

npm install -g "${packages[@]}"
