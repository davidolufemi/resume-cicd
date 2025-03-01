# Deploy to S3

This GitHub Actions workflow automatically deploys your code to an S3 bucket whenever changes are pushed to the `main` branch or a pull request is made targeting the `main` branch. This is ideal for static sites or files that you want to host on AWS S3.

## Workflow Overview

- **Trigger**: The workflow is triggered on `push` and `pull_request` events to the `main` branch.
- **Actions**: The workflow performs the following steps:
  1. **Checkout code**: Retrieves the latest code from the repository.
  2. **Set up AWS credentials**: Configures AWS credentials to authenticate with AWS services.
  3. **Sync files to S3**: Uploads the files (e.g., `index.html`) to the specified S3 bucket.
