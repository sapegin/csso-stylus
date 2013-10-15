should = require 'should'
fs = require 'fs'
path = require 'path'
csso = require '../index'
stylus = require 'stylus'

describe 'basic', ->

	it 'works', (done) ->
		source = fs.readFileSync(path.join(__dirname, 'src/basic.styl'), 'utf8')
		expected = fs.readFileSync(path.join(__dirname, 'expected/basic.css'), 'utf8')

		stylus(source).use(csso()).render (err, out) ->
			should.equal(out, expected)
			done()

	it 'disables restructure', (done) ->
		source = fs.readFileSync(path.join(__dirname, 'src/basic.styl'), 'utf8')
		expected = fs.readFileSync(path.join(__dirname, 'expected/norestructure.css'), 'utf8')

		stylus(source).use(csso({restructure: false})).render (err, out) ->
			should.equal(out, expected)
			done()
