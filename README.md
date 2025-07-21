# OPA S3 Access Policy Challenge

## Overview
This policy ensures only users with IAM role `st-access-role` are allowed access to an AWS S3 bucket. Implemented using Open Policy Agent (OPA) with REGO.

## Files
- `policy.rego`: Policy definition  
- `policy_test.rego`: Test cases  
- `screenshot.png`: Test run result

## Policy Logic

```rego
package s3.access

default allow = false

allow if {
  input.user.role == "st-access-role"
}
```

## Test Cases
- Access granted for role `st-access-role`
- Access denied for other roles or missing role

## Edge Cases
- Missing `user.role` in input  
- Case sensitivity (e.g. `ST-access-role` will fail)  
- Input is null or malformed  

## Logging & Monitoring (Conceptual)
- Integrate OPA decision logs with AWS CloudWatch or SIEM using sidecar logging or Lambda wrapper  
- Use `opa eval` via API Gateway + Lambda for real-time logging  

## Assumptions
- Input follows format: `{"user": {"role": "string"}}`  
- Role strings are case-sensitive and must match exactly  
- Role checking is limited to direct string comparison  

## Author
Shivakrishna
