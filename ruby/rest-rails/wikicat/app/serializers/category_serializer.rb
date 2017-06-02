class CategorySerializer < ActiveModel::Serializer
  attributes :title, :sub_categories
end
