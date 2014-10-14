class LtiLaunchController < ApplicationController
  require 'authentication' # shouldn't need this
  include Authentication

=begin
#<IMS::LTI::ToolProvider:0x007fb87c9bacd0
 @consumer_key="HELLO",
 @consumer_secret="secrets",
 @context_id="47",
 @custom_params={},
 @ext_params={},
 @non_spec_params={},
 @outcome_requests=[],
 @resource_link_id="1">
=end

  def create
    authenticate!
    head :no_content
  end

  def config
    host = request.scheme + "://" + request.host_with_port
    url = (params['signature_proxy_test'] ? host + "/signature_test" : host + "/lti_tool")
    tc = IMS::LTI::ToolConfig.new(:title => "Canvadaptive Testing", :launch_url => url)
    tc.description = "This example LTI Tool Provider supports LIS Outcome pass-back."

    headers 'Content-Type' => 'text/xml'
    tc.to_xml(:indent => 2)
  end
end
