require 'carrierwave'
require 'carrierwave/datamapper'
require 'carrierwave/orm/activerecord'

class Photo < ActiveRecord::Base
  belongs_to :album
  mount_uploader :image, ImageUploader
end



