class LtiController < ApplicationController
  require 'authentication' # shouldn't need this
  include Authentication
  skip_before_filter :verify_authenticity_token, :only => [:launch, :config]

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
  def launch
    authenticate!
    @launch_params = params.reject! {|k,v| ['controller', 'action'].include? k }
    # 1. DB backed storage of launches (reference by ID, serialized content)
    if @launch_params["ext_roles"] =~ /Instructor/
      redirect_to "/"
    else
      redirect_to tests_path
    end
  end

  def xml_config
    host = "#{request.protocol}#{request.host_with_port}"
    url = "#{host}#{lti_launch_path}"
    title = "Canvadaptive Testing"
    tool_id = 'canvadaptive'
    tc = IMS::LTI::ToolConfig.new(:title => "Canvadaptive Testing", :launch_url => url)
    tc.extend IMS::LTI::Extensions::Canvas::ToolConfig
    tc.set_custom_param("canvas_user_id", "$Canvas.user.id")
    tc.description = "An Adaptive Testing framework for administering certification exams"
    tc.canvas_privacy_anonymous!
    tc.canvas_domain!(request.host)
    tc.canvas_icon_url!("#{host}/assets/common/icon.png")
    tc.canvas_text!(title)
    tc.canvas_course_navigation!(enabled: true)

    render xml: tc.to_xml(:indent => 2)
  end
  def post_grades()
    # post the score to the TC, score should be a float >= 0.0 and <= 1.0
    # this returns an OutcomeResponse object
    #response = @tp.post_replace_result_with_data!(score, data_which_resembles_json)
    #TODO RESTORE @tp from the params
    response = @tp.post_replace_result!(score)
    if response.success?
      # grade write worked
    elsif response.processing?
    elsif response.unsupported?
    else
      # failed
    end
  end
end
