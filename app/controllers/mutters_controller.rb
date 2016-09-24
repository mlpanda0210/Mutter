class MuttersController < ApplicationController
  before_action:set_mutter, only:[:edit, :update, :destroy]
  
  def index
    @mutters = Mutter.all.order("id DESC")
    
   if params[:back]
    @mutter = Mutter.new(mutters_params)
    else
    
    @mutter = Mutter.new
  end
  
    
  end

  def new
    if params[:back]
    @mutter = Mutter.new(mutters_params)
    else
    
    @mutter = Mutter.new
  end
  end

  def create
    @mutter=Mutter.new(mutters_params)
    if @mutter.save
    redirect_to mutters_path, notice:"つぶやきました！"
  else
    render action:'new'
  end
end

  
  def confirm
    @mutter=Mutter.new(mutters_params)
    @mutters=Mutter.all
    render :index if @mutter.invalid?
  end
  
  def edit
  
  end
  
  def update
    @mutter.update(mutters_params)
     redirect_to mutters_path, notice:"つぶやき更新しました！"
  end
    
  def destroy
   
    @mutter.destroy
    redirect_to mutters_path, notice:"つぶやき削除しました！"
  end

  private
    def mutters_params
      params.require(:mutter).permit(:content)
    end
    
    def set_mutter
      @mutter=Mutter.find(params[:id])
    end
  end
  