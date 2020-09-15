class RecieptDate < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '明日' },
    { id: 2, name: '明後日' },
    { id: 3, name: '3日後' },
    { id: 4, name: '4日後' },
    { id: 5, name: '5日後' }
  ]
end
