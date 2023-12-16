- You can create a segmentation of security roles – no one person has the keys to the kingdom.
- The service is monitored and access is logged – giving you the capability to track user activity and prevent, detect, and minimize a security incident.
- You can avoid mistakes – other than the creation of the vault, the services can be automated.
- AKV cloud services are available, accessible, and distributed to ensure high reliability for your services.

![[2-azuread-and-azure-roles.png]]

## How does Azure RBAC work?
You can control access to resources using Azure RBAC by creating role assignments, which control how permissions are enforced. To create a role assignment, you need three elements: a security principal, a role definition, and a scope. You can think of these elements as "who," "what," and "where."

### 1. Security principal (who)
### 2. Role definition (what you can do)
### 3. Scope (where)

### Role assignment

Once you have determined the who, what, and where, you can combine those elements to grant access. A _role assignment_ is the process of binding a role to a security principal at a particular scope for the purpose of granting access. To grant access, you'll create a role assignment. To revoke access, you'll remove a role assignment.

The following example shows how the Marketing group has been assigned the Contributor role at the sales resource group scope.

![An illustration showing a sample role assignment process for Marketing group, which is a combination of security principal, role definition, and scope. The Marketing group falls under the Group security principal and has a Contributor role assigned for the Resource group scope.](https://learn.microsoft.com/en-us/training/modules/secure-azure-resources-with-rbac/media/2-rbac-overview.png)