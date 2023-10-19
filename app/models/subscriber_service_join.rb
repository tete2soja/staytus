# == Schema Information
#
# Table name: subscriber_service_joins
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  service_id    :integer
#  subscriber_id :integer
#

class SubscriberServiceJoin < ActiveRecord::Base

  belongs_to :subscriber
  belongs_to :service

end
