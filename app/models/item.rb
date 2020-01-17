class Item < ApplicationRecord

    # relationship
    belongs_to :todo

    # model validation
    validates_presence_of :name
end
