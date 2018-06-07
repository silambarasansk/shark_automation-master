ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'shark_test',
    username: 'postgres',
    password: 'pass',
    port: 5432
)

connection = ActiveRecord::Base.connection
get_table_names_query = "select table_name from information_schema.tables WHERE table_type='BASE TABLE' AND table_schema='public' AND table_name NOT LIKE 'schema%';"

table_names = connection.execute(get_table_names_query).values.flatten

ordered_table_names = (['task_product_mappings', 'products'] + table_names).uniq

Before do
  ordered_table_names.each do |table_name|
    connection.execute("Delete from #{table_name}")
  end
end
