package s3.access

default allow = false
default deny_reason = []

allow if {
  "st-access-role" in input.user.roles
   input.action.in {"s3:Getobject","s3:ListBucket"}
}


# Map roles to allowed actions 
role-actions={"st-access-role :"{"s3:Getobject","s3:ListBucket"}
}

allow if {
  some r
  r := input.user.roles[_]
  r == "st-access-role"
  input.action in role-actions[role]
  input.context.mfa_authenciated == true
  input.contect.source_ip = "10.0.0.10"
  hour := input.context_request_hour
  hour >= 9
  hour < 18

}
