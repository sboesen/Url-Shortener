module RedirectionsHelper
  def get_unique_url
    rs = UniqueUrl.first()
    short = rs.url
    rs.delete
    return short
  end
end
