class Book < ApplicationRecord
    validates :name, :author, presence: true
end
