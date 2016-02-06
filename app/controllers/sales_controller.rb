class SalesController < ApplicationController
  before_action :login_required, only: [ :new, :create, :your_sales, :sold, :unsold, :report_as_sold, :edit ]

  def index
    conditions = Array.new
    
    unless params[:server_id].blank?
      conditions << "server_id = #{params[:server_id]}"
    end

    unless params[:region_id].blank?
      if params[:region_id].starts_with?("continent_")
        continent_id = params[:region_id].split('_')[1]
        regions = Continent.find(continent_id).regions.collect { |region| region.id }
        region_ids = regions.join(", ")
        conditions << "region_id in (#{region_ids})"
      else
        conditions << "region_id = #{params[:region_id]}"
      end
    end

    unless params[:property_id].blank?
      conditions << "property_id = #{params[:property_id]}"
    end

    unless params[:size_id].blank?
      conditions << "size_id = #{params[:size_id]}"
    end

    unless params[:price_min].blank?
      conditions << "price >= #{params[:price_min]}"
    end

    unless params[:price_max].blank?
      conditions << "price <= #{params[:price_max]}"
    end

    unless params[:appraisal].blank?
      conditions << "appraisal = true"
    end

    sql = "SELECT sales.*, properties.size_id FROM sales INNER JOIN properties ON sales.property_id = properties.id WHERE status_id = #{Status.selling.id}"
    if conditions.size > 0
      sql += " and " + conditions.join(" and ")
    end

    sql += " order by created_at DESC"
    @sales = Sale.paginate_by_sql(sql, page: params[:page], per_page: 20)
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(allowed_parameters)
    @sale.user = current_user
    @sale.status = Status.selling
    if @sale.save
      redirect_to @sale, :notice => "Your sale was registered successfully!"
    else
      render 'new'
    end
  end

  def show
    @sale = Sale.includes(:user).find(params[:id])
    if @sale.removed_for_breaking_rules?
      render 'removed_for_breaking_rules'
    else
      if @sale.deleted_by_the_owner?
        render 'deleted_by_the_owner'
      end
    end
    @rating = Rating.new
    @positive_ratings = @sale.user.ratings_by_status(true)
    @negative_ratings = @sale.user.ratings_by_status(false)
  end

  def your_sales
    conditions = Array.new
    
    unless params[:server_id].blank?
      conditions << "server_id = #{params[:server_id]}"
    end

    unless params[:region_id].blank?
      if params[:region_id].starts_with?("continent_")
        continent_id = params[:region_id].split('_')[1]
        regions = Continent.find(continent_id).regions.collect { |region| region.id }
        region_ids = regions.join(", ")
        conditions << "region_id in (#{region_ids})"
      else
        conditions << "region_id = #{params[:region_id]}"
      end
    end

    unless params[:property_id].blank?
      conditions << "property_id = #{params[:property_id]}"
    end

    unless params[:status_id].blank?
      conditions << "status_id = #{params[:status_id]}"
    end

    sql = "SELECT * FROM sales WHERE user_id = #{session[:user_id]}"
    if conditions.size > 0
      sql += " and " + conditions.join(" and ")
    end

    @sales = Sale.find_by_sql(sql)
  end

  def sold
    @sale = Sale.find(params[:id])
    if @sale.user.id == current_user.id
      @sale.mark_as_sold
      redirect_to @sale, :notice => "Congratulations! Your property was marked as sold! =D"
    else
      redirect_to @sale, :alert => "Come on! You don't have permission to do that!"
    end
  end

  def unsold
    @sale = Sale.find(params[:id])
    if @sale.user.id == current_user.id
      @sale.mark_as_unsold
      redirect_to @sale, :notice => "Ok, no problem, we still trying to sell your property!"
    else
      redirect_to @sale, :alert => "Come on! You don't have permission to do that!"
    end
  end

  def report_sold
    @sale = Sale.find(params[:id])
    report = SoldReporting.new(user: current_user, sale: @sale)
    if report.valid?
      report.save
      redirect_to @sale, :notice => "Ok, thanks for reporting!"
    else
      redirect_to @sale, :alert => "You already report this property as sold!"
    end
  end

  def report_breaking_rules
    @sale = Sale.find(params[:id])
    SaleMailer.breaking_rules_notification(@sale).deliver
    redirect_to @sale, :notice => "Thanks for reporting!"
  end

  def edit
    @sale = Sale.find(params[:id])
    if @sale.user.id != current_user.id
      redirect_to @sale, :alert => "Come on! You don't have permission to do that!"
    end
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.user.id == current_user.id
      @sale.update(allowed_parameters)
      redirect_to @sale, :notice => "Your sale was successfully updated!"
    else
      redirect_to @sale, :alert => "Come on! You don't have permission to do that!"
    end
  end

  private

  def allowed_parameters
    params.require(:sale).permit(:title, :price, :contact_ingame, :property_id, :appraisal, :items, :obs, :server_id, :region_id, :x, :y)
  end
end
