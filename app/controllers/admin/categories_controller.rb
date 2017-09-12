class Admin::CategoriesController < BaseAdminController

  before_action :set_product, except: [:index,:new,:create]
  before_action :set_page_name, except: [:create,:update,:destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_root_path,notice: 'Criado com sucesso'
    else
      redirect_to :back,notice: 'Ocorreu um erro'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def set_page_name
    @page = t(params[:action], scope: 'controllers.categories')
  end

end
