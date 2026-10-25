# Study notes

## Week 1: Azure RBAC
**What it is:** Controls who can do what in Azure, at a scope, and permissions flow down.

**When I'd use it:** Giving a team Reader on one resource group instead of the subscription.

**What confused me:** Group role assignments took a few minutes to show. Ctrl+F5 fixed the view.


## Week 1: Azure Policy
**What it is:** Rules for what's allowed to exist, like denying resources without an owner tag.

**When I'd use it:** Enforcing tags and locations across a subscription.

**What confused me:** The storage provider wasn't registered, and the error said SubscriptionNotFound. Registered it then tried again and had no further issues.

## Week 1: Bicep
**What it is:** A programming language used to deploy Azure resources by just running a file.

**When I'd use it:** To automate the provisioning of new resources that would otherwise need manual input and tweaks each time they are deployed. E.g. needing to add a tag or configuration to every created Storage account.

**What confused me:** Pushing to GitHub was new to me but worked well and had no issues, I created a new branch for the storage.bicep file then merged it to main after testing was complete.

## Week 2: Storage: Redundancy and SAS
**What it is:** The system in Azure used to change the redundancy settings and file sharing of Storage accounts.

**When I'd use it:** To select where a storage account is replicated to based on how mission critial the files inside are. SAS is used to share the files inside of a Storage account's containers.

**What confused me:** When creating an SAS, I was in the Storage account section and not the container section, meaning the link I was generating would have given access to the full Storage account instead of just the files. When creating a read-only link in the container section, I was easily able to paste that link into a private window and open and read the text file that I shared using the link.

**Addtional Notes:** Leak linking is the biggest worry with SAS since they have no account authentication, hence why I would choose Entra ID guest accounts over SAS links for important/confidental files. Having a guest account with the access it needs to manage or query a Storage account is much safer and ensures that a leaked link won't make a difference. This is also important as revoking the access means rotating the account key, which kills off any other SAS links you've made on that Storage account.