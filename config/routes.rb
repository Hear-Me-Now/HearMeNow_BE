Rails.application.routes.draw do
  get '/graphiql', to: 'graphiql#index' if Rails.env.development? || Rails.env.production?
  post "/graphql", to: "graphql#execute"
end
