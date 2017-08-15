# # encoding: utf-8

# Inspec test for recipe expensify::app_b

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe port(80) do
  it { should be_listening }
end

describe command('curl localhost') do
  its(:stdout) { should match(/b/) }
end

describe command('curl localhost') do
  its(:stdout) { should_not match(/a/) }
end
