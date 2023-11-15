require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @user = User.create(name: 'Lily')
    @post = Post.create(author: @user, title: 'Title')
  end

  context '#create' do
    it 'is not valid without the post' do
      comment = Comment.new(user_id: @user)
      expect(comment).not_to be_valid
    end

    it 'is not valid without the user' do
      comment = Comment.new(post: @post)
      expect(comment).not_to be_valid
    end
  end

  context '#update_post_comments_counter' do
    before :all do
      8.times { |comment_i| Comment.create(author: @user, post: @post, text: (comment_i + 1).to_s) }
    end
  end
end
