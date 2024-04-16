require "sinatra"
require "sinatra/reloader"
require 'active_support/all'

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

get("/payment/new") do
  erb(:new_payment_calc)
end

get("/payment/results") do
  @apr_input = params.fetch("user_apr").to_f
  @apr_final = @apr_input.to_fs(:percentage, {:precision => 4})

  @years_final = params.fetch("user_years").to_i

  @principal_input = params.fetch("user_pv").to_f
  @principal_final = @principal_input.to_fs(:currency)

  @r = (@apr_input.to_f / 100) /12
  @n = @years_final.to_i * 12
  @pv = @principal_input
  @numerator = @r*(@pv)
  @denominator = 1-(1+@r)**-@n

  @payment_calc = @numerator/@denominator
  @payment_result = @payment_calc.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @minimum = params.fetch("user_min").to_f
  @maximum = params.fetch("user_max").to_f

  @random_result = rand(@minimum...@maximum)

  erb(:random_results)
end
