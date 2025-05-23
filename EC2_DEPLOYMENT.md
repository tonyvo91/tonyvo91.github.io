# Deploying Your Portfolio to AWS EC2

This guide will help you deploy your personal portfolio website to an AWS EC2 instance, making it accessible on the internet.

## Prerequisites

1. An AWS account
2. Basic knowledge of AWS services
3. Your portfolio files ready for deployment

## Step-by-Step Deployment Process

### 1. Launch an EC2 Instance

1. Sign in to the AWS Management Console: https://console.aws.amazon.com/
2. Navigate to the EC2 service
3. Click "Launch Instance"
4. Choose Amazon Linux 2 AMI (free tier eligible)
5. Select t2.micro instance type (free tier eligible)
6. Configure instance details (default settings are fine for a basic setup)
7. Skip storage changes (default 8GB is sufficient)
8. Add tags if desired (e.g., Name: PersonalPortfolio)
9. Configure Security Group:
   - Create a new security group
   - Add HTTP (port 80) and HTTPS (port 443) rules to allow web traffic
   - Keep SSH (port 22) for remote access
10. Review and launch the instance
11. Create or select an existing key pair (you'll need this to access your instance)
12. Launch the instance

### 2. Connect to Your EC2 Instance

Using SSH:
```
ssh -i /path/to/your-key-pair.pem ec2-user@your-ec2-public-ip
```

### 3. Transfer Your Portfolio Files

From your local machine, use SCP to copy your portfolio files:
```
scp -i /path/to/your-key-pair.pem -r /Users/tony/Documents/personal_portfolio/* ec2-user@your-ec2-public-ip:~/portfolio/
```

### 4. Deploy Your Portfolio

Once connected to your EC2 instance and your files are transferred:
```
cd ~/portfolio
chmod +x deploy.sh
./deploy.sh
```

### 5. Access Your Portfolio

Your portfolio should now be accessible at:
```
http://your-ec2-public-ip
```

## Setting Up a Domain Name (Optional)

To use a custom domain name instead of the EC2 IP address:

1. Register a domain through Route 53 or any domain registrar
2. Create a DNS record pointing to your EC2 public IP
3. For Route 53:
   - Create a hosted zone for your domain
   - Create an A record pointing to your EC2 IP address

## HTTPS Setup (Optional)

To secure your site with HTTPS:

1. Install Certbot on your EC2 instance:
   ```
   sudo amazon-linux-extras install epel -y
   sudo yum install certbot python-certbot-nginx -y
   ```

2. Obtain and install a certificate:
   ```
   sudo certbot --nginx -d yourdomain.com
   ```

## Maintaining Your Deployment

### Updating Your Portfolio

When you make changes to your portfolio, simply:

1. Transfer the updated files to your EC2 instance
2. Run the deploy script again

### Monitoring and Maintenance

- Regularly check your EC2 instance health in the AWS console
- Set up CloudWatch alarms for monitoring (optional)
- Keep your instance up to date with security patches

## Cost Considerations

- A t2.micro instance is free tier eligible for 12 months
- After the free tier period, costs are approximately $8-10/month
- Consider using Lightsail (starts at $3.50/month) as a more cost-effective alternative for simple websites
