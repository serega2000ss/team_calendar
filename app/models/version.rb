class Version < PaperTrail::Version
  belongs_to :user, foreign_key: 'whodunnit'
end