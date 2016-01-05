class TagsUrl < ActiveRecord::Base
    belongs_to :urls , :dependent => :destroy
    belongs_to :tags , :dependent => :destroy
end
