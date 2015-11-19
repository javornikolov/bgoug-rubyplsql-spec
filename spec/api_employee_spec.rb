describe "Object types and ref cursors blob" do
  include EmployeeFactory

  it "can fetch object type from from ref cursor" do
    employee = create_employee(:last_name => 'John')

    plsql.api_employee.get_employee(
      :emp_id => employee[:employee_id]
    ) do |result|
      expect(result[:op_cursor].fetch_hash[:complex_type][:last_name]).to eq 'John'
    end
  end
end
