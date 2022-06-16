# frozen_string_literal: true

# Visible module
module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = %w[public private archived].freeze

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  def archived?
    status == 'archived'
  end
end
