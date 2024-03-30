# frosen_string_literal: true
module V1
  class API < Grape::API
    version 'v1', using: :path

    mount Weather
    mount Backend
  end
end