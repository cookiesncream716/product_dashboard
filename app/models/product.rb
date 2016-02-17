class Product < ActiveRecord::Base
	belongs_to :category
	has_many :comments
	def self.get_all
		self.select("products.id, products.name, products.description, products.pricing, products.category_id, categories.id as cat_id, categories.name as cat_name").joins(:category)
	end
	def self.create_product(product_params)
		self.create(product_params)
	end
	def self.get_product(id)
		self.select("products.id, products.name, products.description, products.pricing, products.category_id, categories.id as cat_id, categories.name as cat_name").joins(:category).find(id)
		# self.find(id)
	end
	def self.update_product(id, product_params)
		self.find(id).update_attributes(product_params)
	end
	def self.delete_product(id)
		self.find(id).destroy
	end
end
