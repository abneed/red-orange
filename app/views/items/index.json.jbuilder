if @items
  json.array! @items = @items.is_a?(Array) ? @items : [@items], partial: 'items/item', as: :item
end
