module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # 全てのデータの取得
    field :users, [Types::UserType], null: false
    def users
       User.all
    end

     # 引数の番号のデータを取得
     field :user, Types::UserType, null: false do
       argument :id, ID, required: true
     end
     def user(id:)
       User.find(id)
     end
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
