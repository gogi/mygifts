class VisitorsController < ApplicationController
  expose(:gifts) { user_signed_in? ? current_user.gifts : [] }
  expose(:user) { current_user }
  expose(:ideas) { user_signed_in? ? current_user.ideas : [] }
end
