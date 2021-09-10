defmodule Goose.Timeline.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :likes_count, :integer, default: 0
    field :reposts_count, :integer, default: 0
    field :username, :string, default: "Gooseling"

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:username, :body])
    |> validate_required([:username, :body])
    |> validate_length(:body, min: 2, max: 280)
    |> validate_length(:username, min: 2, max: 20)

  end
end
