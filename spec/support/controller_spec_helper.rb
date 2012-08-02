module ControllerSpecHelper
  ########################################################
  #
  # Requesting pages
  #
  ########################################################

  def get_page(*args, &block)
    get(*args, &block)
    response.should be_success
  end

  def post_page(*args, &block)
    post(*args, &block)
    response.should be_success
  end

  ########################################################
  #
  # HTML assertions
  #
  ########################################################

  def assert_text_on_page(*texts)
    texts.map(&:to_s).each do |text|
      raise("Cannot check for blank text on page") if text.blank?
      assert_select("*", Regexp.new(Regexp.escape(CGI.escapeHTML(text)), Regexp::IGNORECASE))
    end
  end

  def assert_form_errors
    assert_select(error_message_selector)
  end

  def error_message_selector
    "div#errorExplanation"
  end
end
