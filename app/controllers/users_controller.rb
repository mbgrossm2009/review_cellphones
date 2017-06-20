class UserController < ApplicationController

  def make_admin
    current_user.update_attributes(admin: true)
  end
end
