module Api
  class ClockInsController < Api::BaseController
    api :POST, "/users/me/clock_ins", "Clock in"
    description "Clock in"
    formats [ "json" ]
    def create
      user = Current.user
      # check user today clocked in
      if user.clock_ins.today.exists?
        render json: { message: "Already clocked in" }
        return
      end
      user.clock_ins.create!(clocked_at: Time.current)
      render json: { message: "Clocked in" }, status: :created
    end
  end
end
