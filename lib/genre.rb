require_relative 'concerns/findable.rb'
class Genre 
  attr_accessor :name
    extend Concerns::Findable
  @@all = []
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def songs
   @songs
  end
  
  def artists
    songs.collect{|s| s.artist}.uniq
  end
  
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def self.all
    @@all
  end
  
 
 def add_song(song)
    song.genre = self if (song.genre == nil)
    @songs << song if !(@songs.include?(song))
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
  