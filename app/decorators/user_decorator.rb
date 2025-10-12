class UserDecorator < Draper::Decorator
  delegate_all

  def image_resize(width, height)
    if avatar.attached? && avatar.blob.present?
      avatar.variant(resize_to_limit: [width, height]).processed
    else
      ActionController::Base.helpers.asset_path('sakana.jpg')
    end
  end
end
