class Redirection < ActiveRecord::Base
  attr_accessible :url
  validates_format_of :url, with: URI::regexp(%w(http https))
  before_save :generate_short_url
  def generate_short_url
    rs = UniqueUrl.first()
    self.path = rs.url
    rs.delete
  end
end
