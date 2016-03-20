# options json render
json.(@chapter, :id, :title, :body)
json.child_options  @chapter.child_options,  partial: 'options/option', as: :option
json.parent_options @chapter.parent_options, partial: 'options/option', as: :option