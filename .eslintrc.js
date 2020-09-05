// eslint config file
// Rediscovering js(pg11)


"use strict";
module.exports = {
  env: {
    es6: true,
    node: true,
    //browser: true
  },
  extends: "eslint:recommended",
  rules: {
    eqeqeq: "error",
    strict: "error",
    "no-var": "error",
    "prefer-const": "error",
    "no-console": "off",
    indent: ["error", 2],
    "linebreak-style": ["error", "unix"],
    semi: ["error", "always"],
  },
};
