class VisitorsController < ApplicationController
  expose(:gifts) { current_user.gifts }
  expose(:user) { current_user }
  expose(:ideas) { current_user.ideas }
end
