describe "Dummy lpad test" do
  it "can lpad with 0" do
    expect(plsql.lpad("zoo", 5, "0")).to eq "00zoo"
  end
end
