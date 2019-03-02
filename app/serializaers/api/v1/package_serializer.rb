module Api::V1
  class PackageSerializer < ActiveModel::Serializer
    attributes :name, :exam_level, :visible, :description, :slug, :updated_at,
               :position, :image_url

    def image_url
      'AWS_CDN_' + self.object.slug + '.jpg'
    end
  end
end