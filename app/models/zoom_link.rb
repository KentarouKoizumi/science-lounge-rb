class ZoomLink < ApplicationRecord
    validates :label,{presence: true}
    validates :link,{presence: true}
end
