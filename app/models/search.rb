class Search
  def self.for(keyword)
    Wiki.eager_load(:collaborators).where("title LIKE ? AND private = ?", "%#{keyword}%", false) +
      User.where("name LIKE ?", "%#{keyword}%")
  end
end
