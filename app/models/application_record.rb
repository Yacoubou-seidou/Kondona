class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  protected

  def after_sign_in_path_for(_resource)
    home_new_path
  end
end
