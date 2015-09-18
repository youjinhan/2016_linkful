class TagsUrl < ActiveRecord::Base
    belongs_to :urls
    belongs_to :tags
end
