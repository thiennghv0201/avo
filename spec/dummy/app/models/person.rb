# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#  person_id  :bigint
#
class Person < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :person, foreign_key: :person_id, optional: true
  has_many :spouses, foreign_key: :person_id, inverse_of: :person
  has_many :relatives, foreign_key: :person_id, class_name: "Person", inverse_of: :person
  has_many :peoples, foreign_key: :person_id, class_name: "Person", inverse_of: :person
end
