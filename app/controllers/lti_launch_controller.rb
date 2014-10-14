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
    redirect_to action: "show"
  end

  def show
  end
end
