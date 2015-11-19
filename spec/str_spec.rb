describe "String Utils" do
  let (:cslist) { "Alpha,Beta,Gamma" }

  it "can split comma-separated list" do
    expect(plsql.str.split(cslist)).to eq ["Alpha", "Beta", "Gamma"]
  end

  it "can split empty string" do
    expect(plsql.str.split("")).to be_empty
  end

  it "can split commas-only strig" do
    expect(plsql.str.split(",,")).to eq [nil, nil, nil]
  end

  it "can split empty and non-empty mix of comma-separated list" do
    expect(plsql.str.split("alpha,,")).to eq ["alpha", nil, nil]
  end

  [
    ["alpha,,",      ["alpha", nil, nil]],
    ["alpha,beta,,", ["alpha", "beta", nil, nil]]
  ].each do |str, arr|
    it "can split '#{str}'" do
      expect(plsql.str.split(str)).to eq arr
    end
  end

  it "can convert a string to uppercase" do
    expect(plsql.str.up("horse")).to eq "HORSE"
  end
end
