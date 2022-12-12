class Article < ApplicationRecord
    validates :title, length: { minimum: 1, maximum: 50 }
end
