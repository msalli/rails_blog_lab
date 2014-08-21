class Post < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :author
  validates_presence_of :content

  has_many :feeds
  has_many :tags, :through => :feeds
end
