module Searchable
#   def filter(params, object)
#     if params[:id] == ('find_all' || 'find')
#       finders(params, object)
#     elsif !(params[:item_id] || params[:merchant_id]).nil?
#       get_it(params, object)
#     else
#       (object.capitalize.constantize).find(params[:id])
#     end
#   end
#
#   def finders(params, object)
#     if params[:id] == 'find_all'
#       (object.capitalize.constantize).where("LOWER(#{object_params.keys.first}) LIKE ?", "%#{object_params.values.first.downcase}%")
#     elsif params[:id] == 'find'
#       require "pry"; binding.pry
#       (object.capitalize.constantize).find_by("LOWER(#{object_params.keys.first}) LIKE ?", "%#{object_params.values.first.downcase}%")
#     end
#   end
#
#   def get_it(params, object)
#   end
#
#   def object_params
#     params.permit(:name)
#   end
end
