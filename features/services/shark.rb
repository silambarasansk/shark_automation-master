# frozen_string_literal: true
require 'net/http'

class SharkService

  @@shark_endpoint = 'http://localhost:3000'
  @@product_code_to_id_mapping = {}

  def create_product_information(category_name, category_description, products)
    create_product_category(category_name, category_description)
    create_products(products)
  end

  def create_task_information(product_code, tasks)
    create_tasks(tasks)
    create_task_product_mapping(product_code)
  end

  private

  def create_product_category(category_name, category_description)
    product_category = FactoryGirl.attributes_for(:product_category, {name: category_name, description: category_description})
    product_category_json = {product_category: product_category}.to_json

    response = WebService.instance.post("#{@@shark_endpoint}/product_categories", product_category_json)
    @product_category_id = JSON.parse(response.body)['id']
  end

  def create_products(products)
    products.each do |product|
      product_json = {product: FactoryGirl.attributes_for(:product, product)}.to_json
      response = WebService.instance.post("#{@@shark_endpoint}/product_categories/#{@product_category_id}/products", product_json)
      product_id = JSON.parse(response.body)['id']
      # @@product_code_to_id_mapping[product['code']] = product_id
      @@product_code_to_id_mapping[product['code']] = @product_category_id
    end
  end

  def create_tasks(tasks)
    @task_ids = tasks.map do |task|
      task_json = {task: FactoryGirl.attributes_for(:task, task)}.to_json
      response = WebService.instance.post("#{@@shark_endpoint}/tasks/", task_json)
      JSON.parse(response.body)['id']
    end
  end

  def create_task_product_mapping(product_code)
    @task_ids.each do |task_id|
      task_product_mapping = FactoryGirl.attributes_for(:task_product_mapping, {'task_id' => task_id, 'product_category_id' => @@product_code_to_id_mapping[product_code]})
      task_product_mapping_json = {task_product_mapping: task_product_mapping}.to_json
       WebService.instance.post("#{@@shark_endpoint}/task_product_mappings/", task_product_mapping_json)
    end
  end
end
