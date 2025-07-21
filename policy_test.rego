package s3.access

test_allow_valid_role if {
  allow with input as {"user": {"role": "st-access-role"}}
}

test_deny_invalid_role if {
  not allow with input as {"user": {"role": "other-role"}}
}

test_deny_missing_role if {
  not allow with input as {"user": {}}
}
