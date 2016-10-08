class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    uri = URI.parse(value)
    if !uri.kind_of?(URI::HTTP) && !uri.kind_of?(URI::HTTPS)
      record.errors[attribute] << (options[:message] || "is not a valid URL")
    end
  end
end
