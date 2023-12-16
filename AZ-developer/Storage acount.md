A single azure subscription can host up to 250 accounts

## Blobs - object store
- Serving images or documents directly to a browser, including full static websites.
- Storing files for distributed access.
- Streaming video and audio.
- Storing data for backup and restoration, disaster recovery, and archiving.
- Storing data for analysis by an on-premises or Azure-hosted service.

### Block blobs
They're named block blobs because files larger than 100 MB must be uploaded as small blocks.
### Page blobs
Page blobs are used to hold random-access files up to 8 TB in size
They're named page blobs because they provide random read/write access to 512-byte pages.
### Append blobs
Append blobs are made up of blocks like block blobs, but they're optimized for append operations. These blobs are frequently used for logging information from one or more sources into the same blob
A single append blob can be up to 195 GB.

## Files - file share
Azure File storage allows you to set up highly available network file shares that you can access by using the standard Server Message Block (SMB) protocol. This means that multiple VMs can share the same files with both read and write access. You can also read the files using the REST interface or the storage client libraries. You can also associate a unique URL to any file to allow fine-grained access to a private file for a set period of time. File shares can be used for many common scenarios:

- Storing shared configuration files for VMs, tools, or utilities so that everyone is using the same version
- Log files such as diagnostics, metrics, and crash dumps
- Shared data between on-premises applications and Azure VMs to allow migration of apps to the cloud over a period of time
- 
## Queue - messaging store
Azure Queue Storage is used to store and retrieve messages. Queue messages can be up to 64 KB in size, and a queue can contain millions of messages. Queues are used to store lists of messages to be processed asynchronously.
## Table Storage - NoSql store


### Shared access signatures (SAS)

Access keys are the easiest approach to authenticating access to a storage account. However, they provide full access to anything in the storage account, similar to a root password on a computer.
You can use a _service-level_ SAS to allow access to specific resources in a storage account. You'd use this type of SAS, for example, to allow an app to retrieve a list of files in a file system, or to download a file.

Use an _account-level_ SAS to allow access to anything that a service-level SAS can allow, plus additional resources and abilities. For example, you can use an account-level SAS to allow the ability to create file systems.

## Encryption at rest

All data written to Azure Storage is automatically encrypted by Storage Service Encryption (SSE) with a 256-bit Advanced Encryption Standard (AES) cipher, and is FIPS 140-2 compliant. SSE automatically encrypts data when writing it to Azure Storage. When you read data from Azure Storage, Azure Storage decrypts the data before returning it. This process incurs no additional charges and doesn't degrade performance. It can't be disabled.

## CORS support
CORS support is an optional flag you can enable on Storage accounts. The flag adds the appropriate headers when you use HTTP GET requests to retrieve resources from the Storage account.

## Role-based access control
Azure Storage supports Microsoft Entra ID and role-based access control (RBAC) for both resource management and data operations. For security principals, you can assign RBAC roles that are scoped to the storage account. You can use Active Directory to authorize resource management operations, such as configuration. Active Directory is supported for data operations on Blob and Queue storage.

## Network
By default, storage accounts accept connections from clients on any network. To limit access to selected networks, you must first change the default action. You can restrict access to specific IP addresses, ranges, or virtual networks.

## Microsoft defender
Microsoft Defender for Storage is currently available for Blob storage, Azure Files, and Azure Data Lake Storage Gen2. Account types that support Microsoft Defender for Cloud include general-purpose v2, block blob, and Blob storage accounts. Microsoft Defender for Storage is available in all public clouds and US government clouds, but not in other sovereign or Azure Government cloud regions.

You can turn on Microsoft Defender for Storage in the Azure portal through the configuration page of the Azure Storage account, or in the advanced security section of the Azure portal. Follow these steps.

1. Launch the Azure portal.
    
2. Navigate to your storage account. Under **Security + Networking**, select **Microsoft Defender for Cloud**.
    
3. Select **Enable Microsoft Defender for Storage**.

## Data lake
Along with role-based access control (RBAC), Azure Data Lake Storage Gen2 provides access control lists (ACLs) that are POSIX-compliant,

## Blob storage
### Storage accounts, containers, tags, and metadata

In Blob Storage, every blob lives inside a _blob container_. You can store an unlimited number of blobs in a container and an unlimited number of containers in a storage account. Containers are _flat_. They can only store blobs, not other containers.