class AjaxUtilityController < ApplicationController

  set_access_control  "view_repository" => [:get_json],
                      "update_archival_record" => [:post]

  def get_json
    @uri = params[:uri]
    @response = JSONModel::HTTP::get_json("/#{@uri}")
    render json: @response, layout: false
  end

  def post_json
    @uri = params[:uri]
    @json = params[:json] || '{}'
    JSONModel::HTTP::post_json(@uri, @json)
    render json: @response, layout: false
  end

end