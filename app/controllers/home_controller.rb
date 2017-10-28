class HomeController < ApplicationController
  before_action :set_resources, only: [:index]
  include ImportHelper
  
  def index
  end
  
  def upload
    do_import params[:file]
  end
  
  private
  
  def set_resources
    @total = Purchase.all.inject(0) { |total, p| total + (p.count_sale * p.item.price) }
    @purchases = Purchase.all    
  end
  
end