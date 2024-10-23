resource "local_file" "random_file" {
  count    = 5
  filename = "file-${count.index}.txt"
  content  = count.index
}

resource "aws_s3_object" "test" {
  count  = length(local_file.random_file)
  bucket = aws_s3_bucket.lambda-s3.id
  key    = local_file.random_file[count.index].filename # Correctly referencing the filename

  # Use the filename attribute for the source path
  source = local_file.random_file[count.index].filename

  depends_on = [local_file.random_file]
}
