require 'rails_helper'

RSpec.describe Post, type: :model do
  before :all do
    @author = User.create(name: 'Lily')
  end

  it 'is valid with a existing title' do
    expect(Post.new(author: @author, title: 'Harry Potter')).to be_valid
  end

  it 'is not valid with a blank title' do
    expect(Post.new(author: @author, title: nil)).to_not be_valid
  end

  it 'is not valid with a title that exceeds 250 characters' do
    expect(Post.new(author: @author, title: '0' * 251)).to_not be_valid
  end

  it 'is not valid with a non-numeric comments_counter' do
    expect(Post.new(author: @author, title: 'Seven Years Later', comments_counter: 'five')).to_not be_valid
  end

  it 'is not valid with a float comments_counter' do
    expect(Post.new(author: @author, title: 'Seven Years Later', comments_counter: 1.5)).to_not be_valid
  end

  it 'is not valid with a negative comments_counter' do
    expect(Post.new(author: @author, title: 'Seven Years Later', comments_counter: -1)).to_not be_valid
  end

  it 'is valid with a integer comments_counter' do
    expect(Post.new(author: @author, title: 'Seven Years Later', comments_counter: 5)).to be_valid
  end

  context '#five_most_recent_comments' do
    before :all do
      @post = Post.create(author: @author, title: 'Title')
      8.times { |comment_i| Comment.create(author: @author, post: @post, text: (comment_i + 1).to_s) }
    end
  end

  context '#update_user_posts_counter' do
    before :all do
      8.times { Post.create(author: @author, title: 'Seven Years Later') }
    end
  end
end
