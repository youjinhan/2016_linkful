class Tag < ActiveRecord::Base
    has_and_belongs_to_many    :urls
    #has_many    :taggings
end
