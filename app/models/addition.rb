class Addition
  include Cequel::Record

  key :id, :timeuuid, auto: true
  column :purchase_date, :timestamp
  column :base_price, :double
#  belongs_to :discount
#  belongs_to :profile
#  belongs_to :story

  #Al crear la addition, mete la fecha actual
  before_create :change_time
  def change_time
    self.purchase_date = Time.now
  end
end
