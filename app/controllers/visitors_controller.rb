class VisitorsController < ApplicationController
  expose(:gifts) { current_user.gifts }
end
