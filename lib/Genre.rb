class Genre
  extend Concerns::Findable
  extend Persistable::ClassMethods
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  
  attr_accessor :name, :songs
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def songs
    @songs 
  end
  
  def artists
    @songs.collect{|s| s.artist}.uniq
  end
  
   def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end
  
end