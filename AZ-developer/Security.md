- Use Microsoft Defender for Cloud
- Verify your application inputs and outputs
- Store your secrets into Key Vault
- Ensure you are using the latest version of your framework, and using its security features
- Verify your program dependencies and libraries are safe to use


The `dotnet` command-line tool has an `add package` and `remove package` option to add or remove NuGet packages, but doesn't have a corresponding `update package` command. However, it turns out you can run `dotnet add package <package-name>` in your project and it will automatically _upgrade_ the package to the latest version. This is an easy way to update dependencies without having to open the IDE.

https://learn.microsoft.com/en-us/training/modules/azure-well-architected-security/
https://cve.mitre.org/

- [OWASP Dependency Check](https://owasp.org/www-project-dependency-check/), which has a [Jenkins plugin](https://plugins.jenkins.io/dependency-check-jenkins-plugin/)
- [Snyk](https://snyk.io), which is free for open-source repositories in GitHub
- [Black Duck](https://www.synopsys.com/software-integrity/security-testing/software-composition-analysis.html) which is used by many enterprises
- [Retire.js](https://github.com/retirejs/retire.js/) a tool for verifying if your JavaScript libraries are out of date; can be used as a plugin for various tools, including [Burp Suite](https://www.portswigger.net)


You can use some tools made specifically for static code analysis for this, as well.

- [Security Code Scan](https://security-code-scan.github.io/)
- [Puma Scan](https://pumasecurity.io/)
- [PT Application Inspector](https://www.ptsecurity.com/ww-en/products/ai/)
- [Apache Maven Dependency Plugin](https://maven.apache.org/plugins/maven-dependency-plugin/)
- [Sonatype](https://ossindex.sonatype.org)
- [And many more...](https://owasp.org/www-community/Source_Code_Analysis_Tools)

For more information on the risks involved in using vulnerable components visit the [OWASP page](https://owasp.org/www-project-top-ten/OWASP_Top_Ten_2017/Top_10-2017_A9-Using_Components_with_Known_Vulnerabilities) dedicated to this topic.

# Classify your data at rest, in process, and in transit
Digital data always exists in one of three states: at **rest**, in **process**, and in **transit**.
### Protect data at rest
Data encryption at rest is a mandatory step toward data privacy, compliance, and data sovereignty.

|   |   |
|---|---|
|Apply disk encryption to help safeguard your data.|Use [Microsoft Azure Disk Encryption](https://learn.microsoft.com/en-us/azure/security/azure-security-disk-encryption-overview), which enables IT administrators to encrypt both Windows infrastructure as a service (IaaS) and Linux IaaS virtual machine (VM) disks. Disk encryption combines the industry-standard BitLocker feature and the Linux DM-Crypt feature to provide volume encryption for the operating system (OS) and the data disks. ‎Azure Storage and Azure SQL Database encrypt data at rest by default, and many services offer encryption as an option. You can use Azure Key Vault to maintain control of keys that access and encrypt your data. See [Azure resource providers encryption model support](https://learn.microsoft.com/en-us/azure/security/azure-security-encryption-atrest) to learn more.|
|Use encryption to help mitigate risks related to unauthorized data access.|Encrypt your drives before you write sensitive data to them.|

### Protect data in transit
The following table lists best practices specific to using Azure VPN Gateway, SSL/TLS, and HTTPS.

|Best practice|Solution|
|---|---|
|Secure access from multiple workstations located on-premises to an Azure virtual network|Use site-to-site VPN.|
|Secure access from an individual workstation located on-premises to an Azure virtual network|Use point-to-site VPN.|
|Move large data sets over a dedicated high-speed wide-area network (WAN) link|Use Azure ExpressRoute. If you choose to use ExpressRoute, you can also encrypt the data at the application level by using SSL/TLS or other protocols for added protection.|
|Interact with Azure Storage through the Azure portal|All transactions occur via HTTPS. You can also use Storage REST API over HTTPS to interact with Azure Storage and Azure SQL Database.|

## SQL Information Protection (SQL IP)

SQL IP brings a set of advanced services and SQL capabilities, forming a new information-protection paradigm in SQL aimed at protecting the data, not just the database:

- **Azure SQL Auditing**: Azure SQL Auditing tracks database events and writes them to an audit log in your Azure storage account, Log Analytics workspace or Event Hubs.
- **Data Discovery & Classifications**: Data Discovery & Classifications is built into Azure SQL Database, Azure SQL Managed Instance, and Azure Synapse Analytics. It provides advanced capabilities for discovering, classifying, labeling, and reporting the sensitive data in your databases.
- **Dynamic data masking**: Azure SQL Database, Azure SQL Managed Instance, and Azure Synapse Analytics support dynamic data masking. Dynamic data masking limits sensitive data exposure by masking it to non-privileged users.
- **Microsoft Defender for Cloud**: Scans your database and makes recommendations to improve security. Also allows you to set up and monitor **Security Alerts**.
- **Transparent data encryption**: Transparent data encryption encrypts your databases, backups, and logs at rest without any changes to your application. To enable encryption, go to each database.

https://learn.microsoft.com/en-us/sql/relational-databases/security/contained-database-users-making-your-database-portable?view=sql-server-ver16

ALTER ROLE db_datareader ADD MEMBER ApplicationUser;
ALTER ROLE db_datawriter ADD MEMBER ApplicationUser;
GO
DENY SELECT ON SalesLT.Address TO ApplicationUser;
GO

## Transparent data encryption

Azure SQL Database protects your data at rest using transparent data encryption (TDE). TDE performs real-time encryption and decryption of the database, associated backups, and transaction log files at rest without requiring changes to the application. Transparent data encryption performs real-time I/O encryption and decryption of the data at the page level by using a database encryption key. Each page is decrypted when it's read into memory and then encrypted before being written to disk.

## Dynamic data masking
Data masking rules consist of the column to apply the mask to, and how the data should be masked. You can create your own masking format, or use one of the standard masks, such as:

- Default value, which displays the default value for that data type instead.
- Credit card value, which only shows the last four digits of the number, converting all other numbers to lower case x's.
- Email, which hides the domain name and all but the first character of the email account name.
- Number, which specifies a random number between a range of values. For example, on the credit card expiry month and year, you could select random months from 1 to 12 and set the year range from 2018 to 3000.
- Custom string, which allows you to set the number of characters exposed from the start of the data, the number of characters exposed from the end of the data, and the characters to repeat for the remainder of the data.

## Azure SQL Database auditing

By enabling auditing, operations that occur on the database are stored for later inspection or to have automated tools analyze them. Auditing is also used for compliance management or understanding how your database is used. Auditing is also required if you wish to use Azure threat detection on your Azure SQL database.

You can use SQL database auditing to:

- Retain an audit trail of selected events. You can define categories of database actions to be audited.
- Report on database activity. You can use preconfigured reports and a dashboard to get started quickly with activity and event reporting.
- Analyze reports. You can find suspicious events, unusual activity, and trends.

Audit logs are written to Append Blobs in an Azure Blob Storage account that you designate. Audit policies can be applied at the server-level or database-level. Once enabled, you can use the Azure portal to view the logs, or send them to Log Analytics or Event Hubs for further processing and analysis.

## Immutable storage and data retention

Immutable storage for Azure Blob Storage allows users to store business-critical data in a write-once, read-many (WORM) state. This state makes the data unerasable and unmodifiable for a user-specified interval. Blobs can be created and read, but not modified or deleted, for the duration of the retention interval.

# Understand data sovereignty
Digital information is always subject to the laws of the country/region where it's stored. This concept is known as _data sovereignty_. Many of the concerns that surround data sovereignty relate to enforcing privacy regulations and preventing data stored in a foreign country/region from being subpoenaed by the host country/region's government.

### Paired regions

Azure operates in multiple geographies around the world. Azure geography is a defined area of the world that contains at least one **Azure Region**. An Azure region is an area containing one or more data centers.

Each Azure region is paired with another region within the same geography, forming a _region pair_. The exception is Brazil South, which is paired with a region outside its geography. Across the region pairs, Azure serializes platform updates (or planned maintenance) so that only one region is updated at a time. If an outage affecting multiple regions occurs, one region in each pair will be prioritized for recovery.

We recommend that you configure business continuity and disaster recovery (BCDR) across regional pairs to benefit from Azure's isolation and VM policies. For apps that support multiple active regions, we recommend using both regions in a region pair, where possible. This approach will ensure optimal availability for apps and minimized recovery time in the event of a disaster.