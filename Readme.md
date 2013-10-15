# CSSO plugin for Stylus [![Build Status](https://travis-ci.org/sapegin/csso-stylus.png)](https://travis-ci.org/sapegin/csso-stylus)

A [CSSO](https://github.com/css/csso) plugin for [Stylus](https://github.com/LearnBoost/stylus).


## Installation

```
npm install csso-stylus --save-dev
```

## Usage

You can include csso-stylus via Stylus’s `use` method:

```js
var stylus = require('stylus');
var csso = require('csso-stylus');

stylus(css)
  .use(csso())
  .render(function(err, output){
    console.log(output);
  });
```

You can also disable [structure minimization](https://github.com/css/csso/blob/master/docs/usage/usage.en.md#as-an-npm-module):

```js
stylus(css)
  .use(csso({restructure: false}))
  ...
```

### Usage with Grunt

You can use `csso-stylus` with [grunt-contrib-stylus](https://github.com/gruntjs/grunt-contrib-stylus):

```js
grunt.initConfig({
  stylus: {
		options: {
			use: [
				require('csso-stylus')
			]
		}
		compile: {
			files: {
				'build/styles.css': 'styles/index.styl'
			}
		}
  }
});
```

Or if you want to pass options:

```js
use: [
	function() { return require('csso-stylus')({restructure: false}); }
]
```


## Release History

### 2013-10-15 v0.0.1

* First release.


---

## License

The MIT License, see the included `License.md` file.
