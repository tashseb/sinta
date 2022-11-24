module TabsHelper
  def check_if_active(tab)
    case params[:controller]
    when "stages"
      tab == "properties" ? "show active" : ""
    end
  end
end
