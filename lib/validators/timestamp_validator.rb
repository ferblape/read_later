class TimestampValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    unless value.is_a?(ActiveSupport::TimeWithZone)
      record.errors[attribute] << (options[:message] || "is not a valid timestamp")
    end
  end
end
