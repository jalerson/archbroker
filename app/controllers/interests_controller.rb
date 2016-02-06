class InterestsController < ApplicationController
  before_action :login_required, only: [ :new, :create, :index, :show, :delete ]

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(allowed_parameters)
    @interest.user = current_user
    if @interest.save
      redirect_to matching_sales_interest_path(id: @interest.id), notice: 'Your interest was successfully registered!'
    else
      render 'new'
    end
  end

  def index
    @interests = current_user.interests
  end

  def show
    @interest = Interest.find(params[:id])
    if @interest.user.id == current_user.id
      render 'show'
    else
      redirect_to interests_path, error: "You can't do that!"
    end
  end

  def delete
    @interest = Interest.find(params[:id])
    if @interest.user.id == current_user.id
      @interest.delete
      redirect_to interests_path, notice: 'Your interest registration was successfully deleted!'
    else
      redirect_to interests_path, error: "You can't do that!"
    end
  end

  def matching_sales
    @interest = Interest.find(params[:id])

    conditions = Array.new
    conditions << "server_id = #{@interest.server.id}"

    if @interest.region.present?
      if @interest.region_code.include?('region_')
        conditions << "region_id = #{@interest.region.id}"
      else
        regions_ids = Array.new
        @interest.region.regions.each do |region|
          regions_ids << region.id
        end
        conditions << "region_id in (#{regions_ids.join(', ')})"
      end
    end

    unless @interest.min_price.blank?
      conditions << "price >= #{@interest.min_price}"
    end

    unless @interest.max_price.blank?
      conditions << "price <= #{@interest.max_price}"
    end

    if @interest.category.present?
      conditions << "category_id <= #{@interest.category.id}"
    end

    if @interest.type.present?
      conditions << "type_id <= #{@interest.type.id}"
    end

    if @interest.size.present?
      conditions << "size_id <= #{@interest.size.id}"
    end

    if @interest.property.present?
      conditions << "property_id <= #{@interest.property.id}"
    end

    if @interest.appraisal
      conditions << "appraisal = true"
    end

    sql = "SELECT sales.*, properties.size_id, properties.category_id, properties.type_id FROM sales INNER JOIN properties ON sales.property_id = properties.id WHERE status_id = #{Status.selling.id}"
    if conditions.size > 0
      sql += " and " + conditions.join(" and ")
    end
    sql += " order by created_at DESC"

    @sales = Sale.paginate_by_sql(sql, page: params[:page], per_page: 20)
  end

  def allowed_parameters
    params.require(:interest).permit(:title, :server_id, :region_code, :min_price, :max_price, :category_id, :type_id, :size_id, :property_id, :appraisal)
  end

end
