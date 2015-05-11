class WikisController < ApplicationController

  def index
    @wikis = policy_scope(Wiki)
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    @creator = User.find(@wiki.user_id)
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create 
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private, :user_id))
    authorize @wiki
    @wiki.user_id = current_user.id
    if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to wikis_path
    else
      flash[:alert] = "There was a error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id]) 
    @wiki.update_attributes(params.require(:wiki).permit(:title, :body, :private, :user_id, :user_ids, :user_ids => []))
    if @wiki.save
      flash[:notice] = "Wiki was updated!"
      redirect_to @wiki
    else
      flash[:alert] = "There was a error saving the wiki. Please try again."
      render :new
    end
  end

  def destroy
  end

end
