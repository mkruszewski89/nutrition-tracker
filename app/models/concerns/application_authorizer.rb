class ApplicationAuthorizer
  attr_reader :record, :user

  def initialize(user: nil, record: nil)
    @user = user
    @record = record
  end

  def authorize(policy)
    raise "Authorization Error" unless policy
  end

  def anyone
    !user || user.try(:role) == 'normal' || user.try(:role) == 'admin'
  end

  def any_user
    user && (user.try(:role) == 'normal' || user.try(:role) == 'admin')
  end

  def owner_or_admin
    user && (record.try(:user) == user || record == user || user.try(:role) == 'admin')
  end

  def owner_only
    user && (record.try(:user) == user || record == user)
  end

  def admin_only
    user && (user.try(:role) == 'admin')
  end

end
