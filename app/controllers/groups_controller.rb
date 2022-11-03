class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render "new"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
  end

  def index
    @groups = Group.all
    @book = Book.new
  end

  def show
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name,:introduction,:group_image,:owner_id)
  end
    
end
