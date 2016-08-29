# Install NPM

brew install nvm

nvm install 5
nvm use 5
nvm alias default 5

# Globally install with npm

packages=(
    ava
    babel-cli
    babel-eslint
    bower
    brunch
    cordova
    code-push-cli
    elm
    elm-css
    elm-live
    elm-oracle
    elm-test
    eslint
    eslint-config-airbnb
    eslint-plugin-jsx-a11y
    eslint-plugin-flowtype
    eslint-plugin-import
    eslint-config-standard
    eslint-plugin-jsx-a11y
    eslint-plugin-import
    eslint-plugin-promise
    eslint-plugin-react
    eslint-plugin-standard
    grunt
    gulp
    hexo-cli
    http-server
    ionic
    ios-deploy
    ios-sim
    js-beautify
    mocha
    nyc
    react-native-cli
    react-native-ignite
    rnpm
    tern
    typings
    webpack
    webpack-dev-server
    xcode
)

npm install -g "${packages[@]}"

npm cache clear
