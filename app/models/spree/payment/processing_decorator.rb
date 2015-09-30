Spree::Payment::Processing.class_eval do

  private

  def gateway_error(error)
    if error.is_a? ActiveMerchant::Billing::Response
      text = error.params['message'] || error.params['response_reason_text'] || error.message
    elsif error.is_a? ActiveMerchant::ConnectionError
      text = Spree.t(:unable_to_connect_to_gateway)
    elsif error.is_a? Braintree::ErrorResult
      text = error.message
    else
      text = error.to_s
    end
    logger.error(Spree.t(:gateway_error))
    logger.error("  #{error.to_yaml}")
    raise Spree::Core::GatewayError.new(text)
  end
end