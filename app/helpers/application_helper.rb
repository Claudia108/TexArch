module ApplicationHelper
  def cache_key_for(model_class, label = "")
    prefix = model_class.to_s.downcase.pluralize
    count = model_class.count
    max_updated = model_class.maximum(:updated_at)
    [prefix, label, count, max_updated].join("-")
  end

  def cache_for_artifact_list(artifact)
    prefix = artifact.class.to_s.downcase.pluralize
    point_type = artifact.first.point_type.downcase
    count = artifact.count
    max_updated = artifact.maximum(:updated_at)
    [prefix, point_type, count, max_updated].join("-")
  end
end
