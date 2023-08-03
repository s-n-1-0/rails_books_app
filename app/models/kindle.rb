class Kindle < ApplicationRecord
    validates :kindle_asin, length: 10..10, allow_blank: true
    validates :paper_asin, length: 10..10, allow_blank: true
end
