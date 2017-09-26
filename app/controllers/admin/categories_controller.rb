class Admin::CategoriesController < BaseAdminController
  load_and_authorize_resource
  before_action :set_category, except: [:index,:new,:create]
  before_action :set_page_name, except: [:create,:update,:destroy]

  def index
    @categories = Category.by_saloon(current_employee.saloon_id)
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
    params.require(:category).permit(:name,:saloon_id)
  end

  def set_page_name
    @page = t(params[:action], scope: 'controllers.categories')
  end

end
