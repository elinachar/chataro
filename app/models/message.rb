class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create_commit { MessageUpdateJob.perform_later(self, self.user) }
end
