class Venue < ActiveRecord::Base
  has_many :reviews
  
  def latest_review
    self.reviews.order("date desc").order("created_at desc").first
  end
  
  def average_rating
    self.reviews.average('rating')
  end
  
  def max_rating
    self.reviews.maximum('rating')
  end
  
  def summary_review
    self.reviews.last.review
  end
  
  def total_ratings
    self.reviews.count
  end
end
