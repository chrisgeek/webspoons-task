class User < ApplicationRecord
  # broadcasts
  after_create_commit {broadcast_prepend_to 'users'}
  after_update_commit {broadcast_replace_to 'users'}
  after_destroy_commit {broadcast_remove_to 'users'}
  VALID_STATUS = %w[active inactive].freeze
  VALID_EMAIL_FORMAT = URI::MailTo::EMAIL_REGEXP
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_FORMAT }
  validates :phone, presence: true
  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: VALID_STATUS }
  validates :title, presence: true
  scope :order_by_columns, lambda {
                             order(updated_at: :asc, name: :asc, email: :asc, title: :asc, phone: :asc, status: :asc)
                           }
  include PgSearch
  pg_search_scope :search, against: %i[email phone name status title]

end
