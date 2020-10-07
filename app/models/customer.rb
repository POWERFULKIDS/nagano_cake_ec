class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #productとcustomerを中間テーブルcart_productsでつなぐ
  has_many :cart_products
  has_many :products, through: :cart_products

  has_many :orders
  has_many :addresses

  # 退会フラグのenum falseは有効会員、trueは退会済み
  # enum customer_status: { '有効': false, '退会済': true }
  #customer_statusが有効の場合は有効会員(ログイン可能)
  def active_for_authentication?
  	super && (self.customer_status == false)
  end

end
