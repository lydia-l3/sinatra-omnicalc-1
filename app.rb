require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num_two = params.fetch("users_number").to_f

  @the_result_two = Math.sqrt(@the_num_two)

  erb(:square_root_results)
end

get("/") do
  "
  <h1>howdy</h1>
  "
end
