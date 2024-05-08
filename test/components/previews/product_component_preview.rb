class ProductComponentPreview < Lookbook::Preview
  def default
    render ProductComponent.new(product: { title: 'Title', description: 'Description' })
  end

  def collection
    products = [
      { title: 'Product 1', description: 'Description 1'},
      { title: 'Product 2', description: 'Description 2'},
      { title: 'Product 3', description: 'Description 3'}
    ]

    render ProductComponent.with_collection(products)
  end
end
