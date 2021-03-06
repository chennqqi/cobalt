# basic.coffee

http = require 'http'
request = require 'request'
should = require 'should'
nock   = require 'nock'
sinon  = require 'sinon'

mongoose = require 'mongoose'

httpopts = {host:'127.0.0.1', port:3000, path:'/'}
baseurl = 'http://127.0.0.1:3000/'

describe 'Content Types', ->
  content_type = (path) ->
    describe '( Path /' + path + ' )', ->
      server = null

      before (done) ->
        server = require 'server'
        server.start (err) ->
          done()

      after (done) ->
        server.stop (err) ->
          done()

      it 'has JSON MIME type on get', (done) ->
        u = baseurl + path
        request.get {url:u}, (err, resp, body) ->
          console.log body
          resp.headers['content-type'].should.include 'application/json'
          done()
