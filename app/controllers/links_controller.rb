class LinksController < ApplicationController

  def index
    render "index.html.erb"
  end

  def new
    @link = Link.new
    render "new.html.erb"
  end

  def create
    @link = Link.new(
      user_id: current_user.id,
      slug: params[:slug],
      target_url: params[:target_url]
    )
      if @link.save
        flash[:success] = "Link created successfully!"
        redirect_to '/links'
      else
        render 'new.html.erb'
      end
  end

  def edit
    render "edit.html.erb"
  end

  def update
    @link = Link.update(
    user_id: current_user.id,
    slug: params[:slug],
    target_url: params[:target_url]
    )
    @link.standardize_target_url!
    flash[:success] = "Link updated successfully!"
    redirect_to '/links'
  end

  def destroy
    @link = Links.find_by(params[:id])
    @link.destroyflash[:success] = "Link deleted successfully!"
  end

end
