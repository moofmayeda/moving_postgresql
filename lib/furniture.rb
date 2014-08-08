class Furniture
  attr_accessor :description, :difficulty, :type
  attr_reader :id

  def initialize(attributes)
    @description = attributes['description']
    @difficulty = attributes['difficulty'].to_i
    @id = attributes['id'].to_i
    @type = attributes['type']
  end

  def self.all
    all = []
    results = DB.exec("SELECT * FROM furniture;")
    results.each do |result|
      all << Furniture.new(result)
    end
    all
  end
end
