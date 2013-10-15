/**
 * CSSO plugin for Stylus
 *
 * @author Artem Sapegin (http://sapegin.me)
 */

/*jshint node:true */

var csso = require('csso');
var merge = require('merge');

module.exports = function(options) {
	options = merge({
		restructure: true
	}, options);

	var processCsso = function (src, options) {
		if (options.restructure) {
			return csso.justDoIt(src);
		}
		else {
			return csso.justDoIt(src, true);  // Yeah, `true` switches off restructurization
		}
	};

	return function(style){
		style.on('end', function(css, callback) {
			callback(null, processCsso(css, options));
		});
	};
};
