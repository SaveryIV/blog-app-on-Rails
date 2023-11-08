class Comment < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'user_id'

  # Callbacks
  after_save :update_post_comments_counter

  # Methods
  def update_post_comments_counter
    post.increment!(:comments_counter)
  end
end
