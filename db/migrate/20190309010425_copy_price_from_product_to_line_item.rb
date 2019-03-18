class CopyPriceFromProductToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :price, :decimal

    Product.all.each do |product|
      @line_items = LineItem.where(product_id: product.id)
      if @line_items.present?
        @line_items.each do |line_item|
          line_item.price = product.price
        end
      end
    end
  end
end
