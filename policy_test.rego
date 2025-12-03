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
test_deny_delete_action if {
   not allow with input as {
   "user": {"role": "st-access-role"}
   "action": "s3:DeleteObject",
   "resource": "arn:aws:s3:::my-bucket/*"
   }
}