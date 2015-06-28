module WikisHelper

  def author(wiki, creator)
    if current_user.nil?
      @author = creator.name
    else
      if wiki.user_id == current_user.id
        @author = 'This bliki is yours.'
      else
        @author = 'This bliki was created by ' + creator.name + '.'
      end
    end
    return @author
  end

  def status(wiki)
    if wiki.private == true
      @status = 'This bliki is private.'
    else
      @status = 'This bliki is public.'
    end
    return @status
  end

  def get_user_name(id)
    if id == nil
      return "No updates yet"
    end
    @user = User.find(id)
    return @user.name
  end

  def get_collaborator_id(id)
    if id == nil
      return "No updates yet"
    end
    @user = User.find(id)
    return @user.id
  end

end
