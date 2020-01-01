#----root/outputs.tf-----

#----storage outputs------
output "Bucket_Name" {
  value = module.storage.bucketname
}

