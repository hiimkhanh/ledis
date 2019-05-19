class LinkedList
  def add(value)
    current_node = @head

    if @head.nil?
      @head = Node.new(value, nil)
      return
    end

    while current_node.next != nil
      current_node = current_node.next
    end
    current_node.next = Node.new(value, nil)
    self
  end

  def delete(value)
    current_node.next = @head
    if current_node.value = value
      @head = current_node.next
    else
      while (current_node.next != nil) && (current_node.next.value != value)
        current_node = current_node.next
      end
      unless current_node.next == nil
        current_node.next = current_node.next.next
      end
    end
  end

  def left_pop
    return 'Empty list' if @head.nil?

    current_node = @head
    @head = current_node.next
    current_node.value
  end

  def right_pop
    return 'Empty list' if @head.nil?

    current_node = @head
    if current_node.next.nil?
      left_pop
    else
      until current_node.next.next.nil?
        current_node = current_node.next
      end
      next_node = current_node.next
      current_node.next = nil
      next_node.value
    end
  end

  def return_list
    elements = []
    current_node = @head
    while current_node.next != nil
      elements << current_node
      current_node = current_node.next
    end
    elements << current
  end

  def size
    count = 1
    current_node = @head
    while !current_node.next.nil?
      count+=1
      current_node = current_node.next
    end
    count
  end

  def lrange(start, stop)
    values = []
    count = 0
    current_node = @head

    while !current_node.next.nil? || count < stop.to_i
      if count >= start.to_i && count <= stop.to_i
        values << current_node.value
      end

      count += 1
      current_node = current_node.next
    end

    values
  end
end
