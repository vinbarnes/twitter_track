#!/usr/bin/env ruby -w

require 'rubygems'
require 'appscript'
include Appscript

USER   = '<your_name_goes_here>'
PASSWD = '<your_topsecret_password_goes_here>'

itunes = app('iTunes')
track  = itunes.current_track.name.get
artist = itunes.current_track.artist.get
post   = "listening to '#{track}' by #{artist}"
result = %x[curl -u #{USER}:#{PASSWD} -d status="#{post}" http://twitter.com/statuses/update.json]
