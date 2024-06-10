module Api
  class ProfilesController < Api::BaseController
    api :GET, "/users/me/profile", "Get the current user"
    description "Get the current user"
    formats [ "json" ]
    returns code: 200, desc: "A successful response" do
      property :id, Integer, desc: "User ID"
      property :email, String, desc: "Email"
      property :nickname, String, desc: "Nickname"
      property :avatar, String, desc: "Avatar"
      property :provider, String, desc: "Provider"
      property :open_id, String, desc: "Open ID"
      property :role, String, desc: "Role"
      property :created_at, String, desc: "Created at"
      property :updated_at, String, desc: "Updated at"
    end
    def show
      if params["user_id"] != "me"
        render json: { message: "Current params user_id must me" }, status: :bad_request
        return
      end
      render json: Current.user
    end

    api :PUT, "/users/me/profile", "Update the current user(avatar, nickname)"
    description "Update the current user(avatar, nickname)"
    formats [ "json" ]
    param :profile, Hash, desc: "Profile attributes", required: true do
      param :nickname, String, desc: "Nickname"
      param :avatar, String, desc: "Avatar"
    end
    example <<-EOS
      {
        "avatar": "12222",
        "nickname": "2xxx"
      }
    EOS
    def update
      user = Current.user
      user.update!(profile_params)
      render json: user
    end

    private

    def profile_params
      params.require(:profile).permit(:nickname, :avatar)
    end
  end
end
