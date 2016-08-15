class Link < ActiveRecord::Base
  belongs_to :user
  has_many :visits

  validates :target_url, presence: true
  validates :slug, presence: true

  def standardize_target_url!
    target_url.gsub!("http://", "")
    target_url.gsub!("https://", "")
  end

  def visit_count
    visits.count
  end

end
