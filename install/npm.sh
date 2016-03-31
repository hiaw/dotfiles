# Install NPM

brew install nvm

nvm install 5
nvm use 5
nvm alias default 5

# Globally install with npm

packages=(
    babel-eslint
    bower
    brunch
    cordova
    eslint
    eslint-config-airbnb
    eslint-plugin-react
    grunt
    gulp
    hexo-cli
    http-server
    ionic
    ios-deploy
    ios-sim
    js-beautify
    tern
    typings
)

npm install -g "${packages[@]}"

npm cache clear