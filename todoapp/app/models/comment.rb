class Comment < ActiveRecord::Base
  belongs_to(:list)

# Story: As a programmer, I can add multiple commments to a ToDo record.
  def self.addComment(list_id, comment)
    new_comment = Comment.new
    new_comment.list_id = list_id
    new_comment.comment = comment
    new_comment.save
  end
end
