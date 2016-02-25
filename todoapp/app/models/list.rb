class List < ActiveRecord::Base
  has_many(:comments)
  # Story: As a programmer, I can create a new ToDo record with title and description.
  # Story: As a programmer, I can set a ToDo record with a due date.
  def createItem(title, description, date)
    new_item = List.new
    new_item.title = title
    new_item.description = description
    new_item.save
    new_item.date = date
  end

# Story: As a programmer, I can list all ToDo records.
  def self.listAll
    List.all
  end
# Story: As a programmer, I can set a ToDo record to done given the ID of the record
  def setDone(id)
    new_item = List.find(id)
    new_item.done = true
    new_item.save
  end

# Story: As a programmer, I can list all the records that are done.
  def self.showDone
    List.where(done: true).all
  end

# Story: As a programmer, I can list all the records that are not done.
  def self.showNotDone
    List.where(done: false).all
  end

# Story: As a programmer, I can update the title and description of a ToDo record given the ID of the record.
  def updateItem(id, title, description)
    item = List.find(id)
    item.title = title
    item.description = description
    item.save
  end

# Story: As a programmer, I can destroy a ToDo record given the ID of the record.
  def destroyItem(id)
    item = List.find(id)
    item.destroy
  end

# Story: As a programmer, I can list all the records with a due date.
  def self.listDueDate
    List.where.not(date: nil).all
  end

# Story: As a programmer, I can list all the records without a due date.
  def self.listNoDueDate
    List.where(date: nil).all
  end



end
