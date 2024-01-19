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

### Date:  1/9/24
**Time Spent:** 2 hours
**Progress:** 
- HTML layout and spacing for consistency
- lambda function in AWS to get views value from DynamoDB
- lambda function in AWS to put incremented views value to DynamoDB
- Javascript code for the lambda trigger (API) when site is loaded
**Struggles:**
- Adjusting the margins to achieve desired layout
- Website view count not displaying on website
**Next Steps:**
- Fix Website view count so that it properly displays on front end
-

-----

### Date:  1/10/24
**Time Spent:** 2 Hours
**Progress:**
- Added IAM permissions to lambda function to get and put data to DynamoDB table
- Added DOMContentLoaded to JavaScript code to ensure fetched data from our lambda function is properly loaded
- Fixed path issues for API script
**Struggles:**
- Spend all my time today debugging Website view count not displaying on website
**Next Steps:**
- work on Infrastructure as code
- Add more HTML - Education subsections and Fun Facts section

-----

### Date:  1/11/24
**Time Spent:** 3 Hours
**Progress:**
- Added a cache buster to Javascript code when fetching lambda response
- Specified 'no-cache' in Javascript code
- Exposed and allowed cache control headers to lambda function
- configured max age for cached results to 1 second within lambda
- Added messages to display status when fetching view count: 'Loading', 'Site View Count', and 'Could not load views'
**Struggles:**
- Debug why code working on live server but not when deployed
- Encounted chaching issues that inhibited site from displaying dynamic data (live view website view count)
- Caching issues persisted with safari only
**Next Steps:**
- work on Infrastructure as code
- Add more HTML - Education subsections and Fun Facts section

-----

### Date:  1/12/24
**Time Spent:** 1 Hours
**Progress:**
- Learning more about terraform 
- setup terraform config with aws
- Code for geting dynamoDB data, updating it and putting the data back in dynamoDB
- iac for lambda and IAM role
**Struggles:**
- attempting to work trough iac with terraform to deploy lambda func
**Next Steps:**
- Continue working with terraform
- Touchup CSS and HTML to iprove UI

-----

### Date: 1/13/24
**Time Spent:** 1 Hours
**Progress:**
- Touchup CSS and HTML to iprove UI
- Development log
- 
**Struggles:**
- 
**Next Steps:**
- IAC with terraform

-----

### Date: 1/15/24
**Time Spent:** 3 Hours
**Progress:**
- Finished working with terraform and was able to deploy a lambda function that assumes a role with necessary policies attached to it so that it can access my dynamoDB table to get and update data
- Wrote the IAC to set up AWS resources (Policy, attach the policy to a role, Lambda URL and specifications)
- Added AWS credential to terraform file 
- Setup .gitigonare for secret credentials needed by terraform
- 
**Struggles:**
- Spent time getting familiar with terraform and how to use it to create AWS resources properly
- Debugging my IAC for lambda: forgot to include some vields, Incorrect Syntax
**Next Steps:**
- Debug 'total views' since its not appearing on website anymore
- Clean up my code
- Figure out how to build on my current work
- Think about adding a headshot to first/landing page

-----

### Date: 1/16/24
**Time Spent:** 3 Hour
**Progress:**
- Updated images for projects section
- Tried many different configurations to fix my realtime Site View Count feature
**Struggles:**
- Issues with my realtime Site View Count feature working on live server but not production. Attempted to change data format is different ways. Made sure data was ready when site was loaded. Added "No caching headers" and TTL = 0.
**Next Steps:**
- realtime Site View Count feature 

-----

### Date: 1/18/24
**Time Spent:** 2 Hours
**Progress:**
- Finally debuged realtime Site View Count feature and all its components. FIX: lambda API code was outside the directory that was getting deployed to AWS. So the api fetch call was never being called in deployment server. Hence why it worked in local server.
- Education suction Icons updated
- Formatting and adding more HTML 
**Struggles:**
- realtime Site View Count feature
**Next Steps:**
- Clean up 
- Brainstrom additional features to add

### Date: 
**Time Spent:** 1 Hours
**Progress:**
- 
- 
- 
**Struggles:**
- 
**Next Steps:**
- 
-

### Date: 
**Time Spent:** 1 Hours
**Progress:**
- 
- 
- 
**Struggles:**
- 
**Next Steps:**
- 
-