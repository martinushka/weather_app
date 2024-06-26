# frozen_string_literal: true
require 'grape-swagger'

class RootAPI < Grape::API
  formatter :json, Grape::Formatter::Json
  prefix :api

  helpers do
    def permitted_params
      @permitted_params ||= declared(params, included: false)
    end
  end

   mount ::V1::API

  add_swagger_documentation \
    host: ENV.fetch('SWAGGER_HOST'),
    doc_version: '0.0.1',
    base_path: '',
    mount_path: '/v1/docs',
    add_base_path: true,
    add_version: true,
    info: {
      title: 'Weather API',
      contact_url: 'https://localhost:3000',
    },
    array_use_braces: true
end

