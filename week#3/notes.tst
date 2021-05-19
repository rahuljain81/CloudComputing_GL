Auto Scaling
- Self Healing/ Self Recovery Infrastructure
- Auto Scaling Group (ASG) - Ability to  monitor existing resource utilization and when certain threshold is breached, they are able to take action.
		- Implementation of elasticity from AWS.
		- Terminate EC2 if required.
		- Triggers
			- Upper limit
			- Lower Limit
			- Minimum Size (minimum contribution to target should be 1 instance)
		- Cloud Watch - monitoring capability which keeps an hawk eye on utiliztion and raises an alarm on which autoscaling group has to take action.
		- Custom AMI & Boot Strap Scripts  controlledwhen Instance is added by Auto Scaling Group.
		- ASG - Launch Configuration or Template - these are used to spawn an EC2 instance and install required s/w to make it ready for ASG.
		
		- Launch Template - 5 teams and want to make sure
		
		Auto Scaing Guidance - we don't miss on mandatory parameters when Launch Template is being used.
		
		ASG -  Network Interface option will not be used
		ASG and Lunch Template should not be looked in context of elasticity. It should also be very effective in maintaining the infrastructure.
		
		launch template is immutable. only option is copy template with new version.
		Launch Template is a regional resource and available only in a specific region.
		A single Launch Template can be used by multiple ASG. 1:Many Relationship.
		
		Configuration Dissodance/Configuration Drift - change in configuration in launch template than in production.
		
		On Demand is always prioritized.
		
		Min Size, Desired Capacity and Maximum Size (Artificial upper limit) where Desired Capacity >= Min Size.
		
		Instance Scale-in protection - 
			* enable during my observation window. at no point, ASG will not remove any instance during my peak period. So, it will help me to justify my decision what is the max size of ASG.
			
			* No SqL Instance - Horizontal Scaling.
			That instance will hold some data. How can be arbitary remove the instance.
			
			* Instances where you want to avoid Scale-In by ASG.
			
		Target Tracking Scaling Policy.
		
		Denial of Service Attack
		
		Scaling Policy - Step scaling or simple scaling
		
		AMI are region centric.
		
		
		EFS - mounted across multiple EC2 instances.
			- in AZ, multiple subnets can exist. One Mount Target in any of the subnet for all EC2 instances in that particular AZ.
			- Mount Target will get an IP addres, EC2 has to open nfs port 2049 and atatch tht security group to EC2.
			- Unlike EBS, amout is charged with data stored and expand file system at point of time.
			- Lifecycle Management - moving the data to infrquently stored data.
			- Performance Modes - General Purpose & Max I/O :for big data, mny I/O operation, so mode is Max I/O.
			- Throughput Mode - Bursting or Provisioned.
			- Migration will be required if you want to change performance mode of EFS.
			- Credit Concept exist.
			- It is not a cross region service.
			
		S3 - Object Based storage.
			- 100 soft limit buckets/account. Globally unique names.
			- Minimum File Size is 0Bytes and Max 5 TB, chunk size is 5Gb for multi part upload.
			- Once enabled versioning, disabled can't be done, only suspend versioning is possible.
			- Content Creation (sunrise to sunset of content creation)
				Lifecycle of content - Current -> Reduced Redundancy -> Infrquently Accessed ->Archival (Glacier Service) -> Auto Delete the content 
			- 99.999,999,999 (11 9s) durability. 10 copies of your data by default.
			- Multi Region Replication.
			
			- S3 source of data + CDN (Cloud Front) as cache.
			- Reverse Syncronisation (update Cache and document travels back to S3. Bi Directional Data flow)
			- Static Work of website goes to S3 which in front is CDN. If no dynamic content, then no application server required, no http server required.
			- Eventual Consistency (Strong Read after write for a new file but for a old file, it is eventual consistency)
			- Key Value (Key is file name)
			- Object Lock - Write Once Read Many (WORM)
			- Intelligent Tearing
			- Storage Classes
				- standard - replica >= 3
				- infrequently accessed (not old enough to be archived) - min 30 days old
				- Standard -> One Zone ->Reduced Redundancy -> Intelligent Tiering -> Glacier -> Glacier Deep Archive
			- Transfer Acceleration (Data replicated. Customer can access and update document around the world)
			- Once we create replication rule, exisitng content in bucket will not be replicated over.
			- Delete Marker for soft delete of files deleted. Delete Marker + Delete => permanently deleting the file. Nice way of recovering the documents accidently deleted.
				- Deleting the deleting marker doesn't delete on replica.
			- CORS (Cross Origin Resource Sharing)
			- Storage Lens - View across all buckets , Matrix View - only for a bucket.