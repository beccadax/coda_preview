# CodaPreview
class CodaPreviewController < ActionController::Base
  def mapped_by_file_name
    name = params[:id]
    name.sub! /(_controller|helper)?(\.[\w.]*)?\Z/, ''
    redirect_to "/#{name}"
  end
  
  def mapped_by_folder_name
    name = params[:id]
    
    folder = File.dirname(name)
    
    basename = File.basename(name)
    
    while File.extname(basename) != ""
      extension = File.extname(basename)
      basename = File.basename(basename, extension)
    end
    
#     for route in application.routes.routes
#       route.defaults[:controller]
#     end
    
    redirect_to guess_url folder, basename, extension
  end
  
  def guess_url(folder, basename, extension)
    extension.sub! /\A\./, ""
    
    url_for controller: folder, action: basename, format: extension.to_sym
  rescue
    url_for controller: folder, action: 'show', id: basename, format: extension.to_sym
  rescue
    "/#{folder}"
  end
end