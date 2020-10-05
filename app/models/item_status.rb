class ItemStatus < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '賞味期限2週以内' },
    { id: 2, name: '賞味期限1週以内' },
    { id: 3, name: '賞味期限間近' },
    { id: 4, name: '商品袋破損' },
    { id: 5, name: '商品袋汚損' },
  ]
end
