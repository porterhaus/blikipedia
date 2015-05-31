class Search
  def self.for(keyword, user)
    Wiki.eager_load(:collaborators).where("title LIKE ? AND private = ? OR wikis.user_id = ? OR collaborators.user_id = ?", "%#{keyword}%", false, user, user) +
      User.where("name LIKE ?", "%#{keyword}%")
  end
end
