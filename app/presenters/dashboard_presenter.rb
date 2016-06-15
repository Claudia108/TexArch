class DashboardPresenter

  def user_count
    @users ||= User.count
  end

  def site_count
    @sites ||= Site.count
  end

  def artifact_count
    @artifacts ||= Artifact.count
  end
end
