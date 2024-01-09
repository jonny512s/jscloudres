# Development Log

## Date: 1/5/24
**Time Spent:** 1 hour  
**Progress:**
- Used HTML to write example landing page
- Styled landing page using CSS
- Hosted the website through S3 static hosting

**Next Steps:**
- Set up a custom domain name
- Set up CloudFront and point it to custom domain
- Clean up my index.html file
- Put it on GitLab

-----

## Date: 1/6/24
**Time Spent:** 2 hours  
**Progress:**
- Completely revamped HTML and CSS
- Set up: About me, Experience, Education, Projects sections
- Added images to website
- Purchased domain name via AWS Route53
- Acquired SSL certificate
- Set up CloudFront and HTTPS

**Next Steps:**
- Work on the backend

-----

## Date: 1/7/24
**Time Spent:** 1.5 hours  
**Progress:**
- Setup DynamoDB table
- Wrote Python Lambda to read website view count and write it back to the table
- Set up IAM Roles and permissions for Lambda to read and write to DynamoDB

**Next Steps:**
- Look into putting it on GitLab
- Display the view count on website

-----

## Date: 1/8/24
**Time Spent:** 3 hours 
**Progress:**
- Created an SSH key
- Pushed my local repo to GitHub
- Set up CI/CD with AWS via YAML file
- Created an AWS user and access keys to access S3 bucket
- Enabled necessary policies on S3 bucket
- Configured GitHub with secret variables for my AWS account

**Struggles:**
- Connecting to my GitHub account from VSCode
- Encountered (AccessControlListNotSupported) when calling PutObject. Resolved by adding (PutObject) policy and removing --acl public-read argument from the args section due to the "Bucket Owner Enforced" setting for Object Ownership in my S3 bucket.

**Next Steps:**
- Write API to provide data from DynamoDB
- Display the view count on my website

-----

### Date:  
**Time Spent:**  
**Progress:**
-
-
**Struggles:**
-
-
**Next Steps:**
-
-

-----

### Date:  
**Time Spent:**  
**Progress:**
-
-
**Struggles:**
-
-
**Next Steps:**
-
-