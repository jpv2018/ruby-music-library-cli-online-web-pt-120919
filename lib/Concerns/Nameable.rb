module Nameable
  module ClassMethods
    def create(name)
      self.new(name).tap do |o|
        o.name = name
      end
    end
    def save
      @@all << self
    end
  end
end