# # encoding: utf-8

# Inspec test for recipe expensify::firewall_internal

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe port(22) do
  it { should_not be_listening }
end
