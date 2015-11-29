class IdeasController < ApplicationController
  def idea_params
    params.require(:idea).permit(:user_id, :gift_id, :tag_list)
  end
end
