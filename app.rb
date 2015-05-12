require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/division')
require('./lib/employee')
require('pg')

get('/') do
  erb(:index)
end

get('/hr') do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:hr)
end

get('/divisions') do
  @divisions = Division.all()
  erb(:divisions)
end

post("/divisions") do
  description = params.fetch("description")
  division = Division.new({:description => description, :id => nil})
  division.save()
  @divisions = Division.all()
  erb(:divisions)
end

get("/employees") do
  @employees = Employee.all()
  erb(:employees)
end

post("/employees") do
  name = params.fetch("name")
  employee = Employee.new({:name => name, :id => nil})
  employee.save()
  @employees = Employee.all()
  erb(:employees)
end

get("/employees/:id") do
  id = params.fetch("id").to_i()
  @employee = Employee.find(id)
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:employee_info)
end

patch("/employees/:id") do
  employee_id = params.fetch("id").to_i()
  @employee = Employee.find(employee_id)
  division_ids = params.fetch("division_ids", [])
  @employee.update({:division_ids => division_ids})
  @divisions = Division.all()
  erb(:employee_info)
end

get("/divisions/:id") do
  id = params.fetch("id").to_i()
  @division = Division.find(id)
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:division_info)
end

patch("/divisions/:id") do
  division_id = params.fetch("id").to_i()
  @division = Division.find(division_id)
  employee_ids = params.fetch("employee_ids", [])
  @division.update({:employee_ids => employee_ids})
  @employees = Employee.all()
  erb(:division_info)
end

delete('/employees/:id') do
  employee_id = params.fetch("id").to_i()
  employee = Employee.find(employee_id)
  employee.delete()
  @employees = Employee.all()
  erb(:employees)
end

delete('/divisions/:id') do
  division_id = params.fetch("id").to_i()
  division = Division.find(division_id)
  division.delete()
  @divisions = Division.all()
  erb(:divisions)
end
