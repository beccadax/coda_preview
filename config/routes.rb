Rails.application.routes.draw do
  get 'app/controllers/:id', to: 'coda_preview#mapped_by_file_name', constraints: { id: /.*/ }
  get 'app/assets/javascripts/:id', to: 'coda_preview#mapped_by_file_name', constraints: { id: /.*/ }
  get 'app/assets/stylesheets/:id', to: 'coda_preview#mapped_by_file_name', constraints: { id: /.*/ }
  get 'app/assets/helpers/:id', to: 'coda_preview#mapped_by_file_name', constraints: { id: /.*/ }
  get 'app/views/:id', to: 'coda_preview#mapped_by_folder_name', constraints: { id: /.*/ }
end
