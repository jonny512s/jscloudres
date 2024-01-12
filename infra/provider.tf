// Create lambda function
resource "aws_lambda_function" "cloudResViewsFunc" {
    filename         = data.archive_file.zip_the_python_code.output_path
    source_code_hash = data.archive_file.zip_the_python_code.output_base64sha256
    function_name    = "cloudResViewsFunc"
    role             = aws_iam_role.iam_for_lambda.arn
    handler          = "cloudResViewsFunc.handler"
    runtime          = "python3.8"
}

// Create IAM role for lambda function
resource "aws_iam_role" "iam_for_lambda" {
    name = "iam_for_lambda"
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
  ]
}
EOF
}

// upload lambda function trough zip file
