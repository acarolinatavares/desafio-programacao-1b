module SalesHelper

  def format_sales_errors(errors)
    msg_errors = ''
    errors.each { |key, value|
      msg_errors =  msg_errors + "#{key}: #{array_to_string(value, ',')}<br>"
    }
    msg_errors.html_safe
  end
end