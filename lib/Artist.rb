class Artist
  extend Concerns::Findable
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  
  attr_accessor :name, :songs
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def songs
    @songs
  end
  
  def genres
    @songs.collect {|s| s.genre}.uniq 
  end
    
end