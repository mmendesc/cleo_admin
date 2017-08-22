class ReportsController < ApplicationController

  def top_ten
    @top = Sale.top_ten
  end

end
