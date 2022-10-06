# Creating a AWS secret for database master account (Aurora-Secret-DB)
resource "aws_secretsmanager_secret" "db_secret_manager" {
  name = var.secret_name
}

# Creating a AWS secret versions for database master account (Masteraccoundb)
resource "aws_secretsmanager_secret_version" "sversion1" {
  secret_id     = aws_secretsmanager_secret.db_secret_manager.id
  secret_string = var.secret_string
}
