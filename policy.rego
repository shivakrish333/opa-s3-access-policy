package s3.access

default allow = false

allow if {
  input.user.role == "st-access-role"
}
