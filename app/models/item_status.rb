class ItemStatus < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '経済' },
    { id: 2, name: '政治' },
    { id: 3, name: '地域' },
    { id: 4, name: '国際' },
    { id: 5, name: 'IT' },
    { id: 6, name: 'エンタメ' },
    { id: 7, name: 'スポーツ' },
    { id: 8, name: 'グルメ' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: 'その他' }
  ]
end
