describe "Object types and ref cursors blob" do
  include EmployeeFactory

  before(:each) do
    employee = create_employee(:last_name => 'John')
    @emp_id =  employee[:employee_id]
  end

  it "can fetch object type from from ref cursor" do
    plsql.api_employee.get_employee(:emp_id => @emp_id) do |result|
      emp = result[:op_cursor].fetch_hash[:complex_type]
      expect(emp[:last_name]).to eq 'John'
    end
  end
end
