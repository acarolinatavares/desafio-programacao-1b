class SalesController < ApplicationController
  before_action :load_not_imported_sales, :load_amount, only: :index

  def index
    @sales = Sale.all.paginate(page: params.fetch(:page, 1), per_page: 20)
  end

  def new
  end

  def create
    operation = Sale::Create.call(permitted_params[:attachment])
    if operation.not_imported.blank?
      redirect_to(sales_path(amount: operation.amount), notice: 'Vendas importadas com sucesso!')
    else
      redirect_to sales_path(not_imported: operation.not_imported.to_json), notice: 'Algumas vendas não foram importados.'
    end
  end

  private

  def permitted_params
    params.permit(:attachment)
  end

  def load_not_imported_sales
    @not_imported = JSON.parse params[:not_imported] if params[:not_imported]
  end

  def load_amount
    @amount = params[:amount] if params[:amount]
  end

end
