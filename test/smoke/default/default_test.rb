# # encoding: utf-8

# Inspec test for recipe expensify::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/
describe user('expensify') do
    it { should exist }
end
