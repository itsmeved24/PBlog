# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  after_action :clone_template_posts, only: :create

  private

  def clone_template_posts
    return unless resource.persisted? # ensure the user was actually created

    template_user = User.find_by(email: 'template@example.com')
    return unless template_user

    template_user.posts.where(is_template: true).find_each do |template|
      next unless template.photo.attached?

      new_post = resource.posts.new(
        title: template.title,
        content: template.content,
        is_template: false
      )

      # Download the blob and attach it to the new post
      blob = template.photo.blob
      new_post.photo.attach(
        io: StringIO.new(blob.download),
        filename: blob.filename,
        content_type: blob.content_type
      )
      new_post.save!
    end
  end
end 