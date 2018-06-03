class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  # ApplicationControllerでログイン確認済み
  def create
  end

  def destroy
  end
end
