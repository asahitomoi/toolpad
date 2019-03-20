class Post < ApplicationRecord
	 mount_uploader :post_image_id, ImageUploader

	 has_many :recipes, inverse_of: :post
	 accepts_nested_attributes_for :recipes, reject_if: :all_blank, allow_destroy: true
	 has_many :materials, inverse_of: :post
	 accepts_nested_attributes_for :materials, reject_if: :all_blank, allow_destroy: :true

	 has_many :comments, dependent: :destroy

	 has_many :favorites, dependent: :destroy

	 def favorited_by?(user)
	 	favorites.where(user_id: user.id).exists?
	 end

	 belongs_to :user

	 enum disease: [:脳卒中, :骨折, :脊髄損傷, :神経変性疾患, :心臓疾患, :リウマチ, :精神疾患, :小児, :その他の疾患]

	 enum activity: [:食事, :トイレ, :身だしなみ, :着替え, :入浴, :移動, :乗り移り動作, :コミュニケーション, :"趣味・娯楽", :その他の生活動作]
end