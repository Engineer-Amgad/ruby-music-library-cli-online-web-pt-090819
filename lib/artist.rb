class Artist 
  extend Concerns::Findable
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    save
  end 
  
  def save
    @@all << self
  end 
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(name)
    artist = Artist.new(name) 
    artist
  end 
  
  def songs
    @songs
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    if song.artist == nil
      song.artist = self
    end 
  end 
  
  def genres
    songs.collect{|song| song.genre}.uniq
  end
  
end 