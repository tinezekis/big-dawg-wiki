class Categorization < ActiveRecord::Base
  belongs_to :version
  belongs_to :category
end
