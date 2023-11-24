class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: true

  class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    after_save :update_post_comments_counter
    after_destroy :update_post_comments_counter

    def update_post_comments_counter
      post.update(comments_counter: post.comments.count)
    end
  end
end
