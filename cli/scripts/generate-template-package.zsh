#!/bin/zsh

NAME="themer-$1"

echo Generating $NAME...

PACKAGES_DIR="$(realpath "$(dirname $0:A)/../packages")"
PACKAGE="$PACKAGES_DIR/$NAME"

mkdir $PACKAGE

cat << EOF > $PACKAGE/.gitignore
node_modules
LICENSE.md
EOF

cat << EOF > $PACKAGE/.yarnrc
version-tag-prefix $NAME-v
version-git-message $NAME-v%s
EOF

cat << EOF > $PACKAGE/package.json
{
  "name": "$NAME",
  "version": "1.0.0",
  "description": "TODO",
  "main": "lib/index.js",
  "engines": {
    "node": ">=8.11.4"
  },
  "scripts": {
    "prepublishOnly": "cp ../../../LICENSE.md ./"
  },
  "author": "mjswensen",
  "license": "MIT",
  "files": [
    "/lib/index.js"
  ],
  "repository": {
    "type": "git",
    "url": "git+https://github.com/mjswensen/themer.git"
  },
  "bugs": {
    "url": "https://github.com/mjswensen/themer/issues"
  },
  "homepage": "https://github.com/mjswensen/themer/tree/master/cli/packages/$NAME#readme",
  "peerDependencies": {
    "themer": "^3"
  },
  "keywords": [
    "themer",
    "$NAME"
  ]
}
EOF

cat << EOF > $PACKAGE/README.md
# $NAME

A TODO template for [themer](https://github.com/mjswensen/themer).

TODO

## Installation & usage

Install this module wherever you have \`themer\` installed:

    npm install $NAME

Then pass \`$NAME\` as a \`-t\` (\`--template\`) arg to \`themer\`:

    themer -c my-colors.js -t $NAME -o gen
EOF

LIB="$PACKAGE/lib"
mkdir $LIB

cat << EOF > $LIB/index.js
const render = (colors, options) => {
  // TODO
}

const renderInstructions = paths => \`
TODO
\`;

module.exports = {
  render,
  renderInstructions,
};
EOF

cat << EOF > $LIB/index.spec.js
const { render } = require('./index');
const { colors } = require('../../themer-colors-default');

describe('themer $NAME theme generator', () => {
  // TODO
});
EOF
