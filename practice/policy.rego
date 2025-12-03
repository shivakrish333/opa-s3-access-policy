package s3

deny contains msg if {
    input.bucket.public == true
    msg := "Bucket must not be public"
}

deny contains msg if {
    not input.bucket.encryption.enabled
    msg := "Bucket must have encryption enabled"
}
