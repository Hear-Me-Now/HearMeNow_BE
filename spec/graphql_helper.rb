# frozen_string_literal: true

module GraphqlHelper
  def gql(query)
    body = { query: query }

    post '/graphql', params: body

    JSON.parse(response.body)
  end
end
