class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    find_by_id = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id: find_by_id[0][0], name: find_by_id[0][1], type: find_by_id[0][2])
  end
end
