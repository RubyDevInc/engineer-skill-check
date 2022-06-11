class Article < ApplicationRecord
  belongs_to :Author, class_name: "Employee"
end
