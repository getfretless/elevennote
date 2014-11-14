class Note < ActiveRecord::Base
  belongs_to :user
  scope :latest, -> { order('updated_at DESC').take! }
  before_save :sanitize_body

  private

  def sanitize_body
    self.body_html = Sanitize.fragment body_html, Sanitize::Config::RELAXED
    self.body_text = Sanitize.clean(body_html).strip
  end
end
