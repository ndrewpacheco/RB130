#will fail if value is not nil.


assert_nil value
assert list.empty?

assert_includes list, 'zyx'

#Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.


assert_raises(NoExperienceError) { employee.hire }




def assert_instance_of Numeric, value

end

assert_kind_of Numeric, value

assert_same list, list.process


#Write a test that will fail if 'xyz' is one of the elements in the Array list:

refute_includes list, 'xyz'