class Schedule < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :memo, length: {maximum: 500 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_end_check

  def start_end_check
    if end_date && start_date && self.end_date < self.start_date
      errors.add(:end_date, message: "は開始日より前の日付は登録できません")
    end
  end
end
