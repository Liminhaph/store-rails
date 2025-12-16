class ProductMailer < ApplicationMailer
  def new_product(product)
    @product = product
    mail(to: "admin@example.com", subject: "New product added")
  end
end
