class CustomSet
  def initialize(list = [])
    @members = list
  end

  def size
    @members.size
  end

  def index(member)
    @members.index { |x| x.eql?(member) }
  end

  def ==(other)
    return false unless other.class == self.class
    return false unless other.size == self.size

    other.each do |n|
      return false unless index(n)
    end
    true
  end

  def eql?(other)
    self == other
  end

  def delete(member)
    @members.delete(member) if index(member)
    self
  end

  def intersection(other)
    CustomSet.new(@members.select { |n| other.index(n) })
  end

  def union(other)
    u = CustomSet.new(@members)
    other.each { |n| u.put(n) }
    u
  end

  def put(member)
    @members << member unless index(member)
    self
  end

  def empty
    @members = []
    self
  end

  def to_list
    @members
  end
end
