- The VM itself
- Disks for storage
- Virtual network
- Network interface to communicate on the network
- Network Security Group (NSG) to secure the network traffic
- An IP address (public, private, or both)

## The network
### Secure the network

By default, there's no security boundary between subnets, so services in each of these subnets can talk to one another. However, you can set up Network Security Groups (NSGs), which allow you to control the traffic flow to and from subnets and to and from VMs. NSGs act as software firewalls, applying custom rules to each inbound or outbound request at the network interface and subnet level. This way, you can fully control every network request coming in or out of the VM.

## Plan each VM deployment
- Which OS is used?
- How much disk space is in use?
- What kind of data does this use? Are there restrictions (legal or otherwise) around how it's stored or where it's physically located?
- What sort of CPU, memory, and disk I/O load does the server have? Is there burst traffic to account for?

The VM name is used as the computer name, which is configured as part of the operating system. You can specify a name of up to 64 characters on a Linux VM and 15 characters on a Windows VM.

|Option|Description|
|---|---|
|[General purpose](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-general)|General-purpose VMs are designed to have a balanced CPU-to-memory ratio. Ideal for testing and development, small to medium databases, and low to medium traffic web servers.|
|[Compute optimized](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-compute)|Compute optimized VMs are designed to have a high CPU-to-memory ratio. Suitable for medium traffic web servers, network appliances, batch processes, and application servers.|
|[Memory optimized](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-memory)|Memory optimized VMs are designed to have a high memory-to-CPU ratio. Great for relational database servers, medium to large caches, and in-memory analytics.|
|[Storage optimized](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-storage)|Storage optimized VMs are designed to have high disk throughput and IO. Ideal for VMs running databases.|
|[GPU](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-gpu)|GPU VMs are specialized virtual machines targeted for heavy graphics rendering and video editing. These VMs are ideal options for model training and inferencing with deep learning.|
|[High performance compute](https://learn.microsoft.com/en-us/azure/virtual-machines/sizes-hpc)|High performance compute is the fastest and most powerful CPU virtual machines with optional high-throughput network interfaces.|

### What if my size needs change?

Azure allows you to change the VM size when the existing size no longer meets your needs. You can upgrade or downgrade the VM - as long as your current hardware configuration is allowed in the new size. The ability to change VM size provides a fully agile and elastic approach to VM management.
The VM size can be changed while the VM is running, as long as the new size is available in the current hardware cluster the VM is running on. The Azure portal makes the size options obvious by only showing you available size choices. The command line tools report an error if you attempt to resize a VM to an unavailable size. Changing a running VM size automatically reboots the machine to complete the request.
Be careful about resizing production VMs - they will be rebooted automatically which can cause a temporary outage and change some configuration settings such as the IP address.

### Storage for the VM

All Azure virtual machines have at least two virtual hard disks (VHDs). The first disk stores the operating system, and the second is used as temporary storage. You should add more data disks to store application data. Separating out the data to different disks allows you to manage the disks independently. The VM size determines the maximum number of data disks you can attach to your VM, typically two per vCPU.

**Azure Backup** is a _backup as a service_ offering that protects physical or virtual machines no matter where they reside: on-premises or in the cloud.
## Use Azure Backup

Azure Backup uses several components that you download and deploy to each computer you want to back up. The component that you deploy depends on what you want to protect.

- Azure Backup agent
- System Center Data Protection Manager
- Azure Backup Server
- Azure Backup VM extension

## Resources used in a Windows VM

When creating a Windows VM in Azure, you also create resources to host the VM. These resources work together to virtualize a computer and run the Windows operating system. These must either exist (and be selected during VM creation), or they will be created with the VM.

- A virtual machine that provides CPU and memory resources
- An Azure Storage account to hold the virtual hard disks
- Virtual disks to hold the OS, applications, and data
- Virtual network (VNet) to connect the VM to other Azure services or your own on-premises hardware
- A network interface to communicate with the VNet
- A public IP address so you can access the VM (this is optional)
### What is a Network Security Group?

Virtual networks (VNets) are the foundation of the Azure networking model, and provide isolation and protection. Network Security Groups (NSGs) are the main tool you use to enforce and control network traffic rules at the networking level. NSGs are an optional security layer that provides a software firewall by filtering inbound and outbound traffic on the VNet.

Security groups can be associated to a network interface (for per-host rules), a subnet in the virtual network (to apply to multiple resources), or both levels.