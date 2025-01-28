resource "aws_kms_key" "sops_key" {
  description              = "Clave KMS para cifrar secretos con SOPS"
  deletion_window_in_days  = 7

  # Otros parámetros (opcional)
  tags = {
    Name        = "sops-key"
    Environment = var.env
    Terraform   = "true"
  }
}

resource "aws_kms_alias" "sops_key_alias" {
  name          = "alias/SOPS"
  target_key_id = aws_kms_key.sops_key.key_id
}