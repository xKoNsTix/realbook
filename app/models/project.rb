class Project < ApplicationRecord
    belongs_to :user

    validates :adress, :size, :date, presence: true
    validate :at_least_one_present
    validates :size, numericality: { only_integer: true }

    private

    def at_least_one_present
        unless drone.present? || video.present? || photo.present?
        errors.add(:base, "At least one of drone, video, or photo must be present")
        end
    end
end
