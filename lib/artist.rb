require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    @@artists << self
    @songs = []
  end

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
    @@artists
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) } 
    # uses add_song to iterate through array of song onbjects and add them individually. 
  end

  def to_param
    name.downcase.gsub(' ', '-') # finds pattern and replaces it with second thing
  end
end