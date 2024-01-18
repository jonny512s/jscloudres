// Create lambda function
resource "aws_lambda_function" "cloudResViewsFunc" {
    filename         = data.archive_file.zip_the_python_code.output_path
    source_code_hash = data.archive_file.zip_the_python_code.output_base64sha256
    function_name    = "cloudResViewsFunc"
    role             = aws_iam_role.iam_for_lambda.arn
    handler          = "cloudResViewsFunc.lambda_handler"
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

//create a policy for lambda function with necessary permissions to access dynamoDB table
resource "aws_iam_policy" "iam_policy_for_resume_project" {

  name        = "aws_iam_policy_for_terraform_resume_project_policy"
  path        = "/"
  description = "AWS IAM Policy for managing the resume project role"
    policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Resource" : "arn:aws:logs:*:*:*",
          "Effect" : "Allow"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "dynamodb:UpdateItem",
			      "dynamodb:GetItem",
            "dynamodb:PutItem"
          ],
          "Resource" : "arn:aws:dynamodb:*:*:table/cloudResume"
        },
      ]
  })
}

// attach policy to IAM role
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.iam_policy_for_resume_project.arn
  
}

// upload lambda function trough zip file
data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_file = "${path.module}/lambda/cloudResViewsFunc.py"
  output_path = "${path.module}/lambda/cloudResViewsFunc.zip"
}

// Set up my lambda function URL
resource "aws_lambda_function_url" "url1" {
  function_name      = aws_lambda_function.cloudResViewsFunc.function_name
  authorization_type = "NONE"

  cors {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive", "cache-control"]
    expose_headers    = ["keep-alive", "date", "cache-control"]
    max_age           = 86400
  }
}