# frozen_string_literal: true

class WeeklyDigestMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def digest_email
    @user = params[:user]
    @weekly_digest = WeeklyDigest.new(@user)
    mail(to: @user.email, subject: 'Weekly chat digest')
  end
end
