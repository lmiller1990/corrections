module Posts
  class ClaimController < ApplicationController
    include PostScoped

    def create
      if @post.awaiting_correction?
        # @post.update_attributes!(status: :in_correction)
        redirect_to post_corrections_path @post
      else
        flash.now.alert = 'This job was claimed. Sorry'
        redirect_to jobs_path
      end
    end
  end
end
