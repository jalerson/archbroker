class StoresController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])

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

    unless params[:price_min].blank?
      conditions << "price >= #{params[:price_min]}"
    end

    unless params[:price_max].blank?
      conditions << "price <= #{params[:price_max]}"
    end

    unless params[:appraisal].blank?
      conditions << "appraisal = true"
    end

    sql = "SELECT * FROM sales WHERE status_id = #{Status.selling.id} and user_id = #{@user.id}"
    if conditions.size > 0
      sql += " and " + conditions.join(" and ")
    end

    sql += " order by created_at DESC"
    @sales = Sale.paginate_by_sql(sql, page: params[:page], per_page: 20)
  end
end
