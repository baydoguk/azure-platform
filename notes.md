# Study notes

## Azure RBAC
**What it is:** Controls who can do what in Azure, at a scope, and permissions flow down (management group, subscription, resource group, resource).

**When I'd use it:** Giving a team Reader on one resource group instead of the whole subscription. Assign roles to groups, not individual users.

**What confused me:** Group role assignments took a few minutes to show. Ctrl+F5 fixed the view.

**Additional notes:** Entra roles control the directory (users, apps, security settings). Azure roles control what you can do to Azure resources at a scope. Global Administrator doesn't give access to a subscription by itself. It can be elevated with the "Access management for Azure resources" toggle, which should be switched off again afterwards.

## Azure Policy
**What it is:** Rules for what's allowed to exist, like denying resources without an owner tag. Effects: Audit, Deny, Modify, DeployIfNotExists.

**When I'd use it:** Enforcing tags and locations across a subscription.

**What confused me:** The storage provider wasn't registered on the new subscription, and the error said SubscriptionNotFound. Registering it with `az provider register --namespace Microsoft.Storage` fixed it, with no further issues.

## Bicep
**What it is:** A declarative language for deploying Azure resources. I describe what should exist, and running the file makes Azure match it. Running it again changes nothing if it already matches (idempotent).

**When I'd use it:** To automate provisioning that would otherwise need manual input and tweaks each time, e.g. making sure every storage account is created with the same settings.

**What confused me:** Pushing to GitHub was new to me but worked well. I created a branch for the storage.bicep file, tested it, then merged it to main with a pull request.

## Storage: redundancy
**What it is:** How many copies of the data Azure keeps and where.

- **LRS:** 3 copies in one datacentre. Survives a disk or rack failure.
- **ZRS:** 3 copies across zones in a region. Survives a datacentre (zone) outage.
- **GRS:** LRS here plus LRS in a paired region. Survives a whole region outage.
- **GZRS:** ZRS here plus LRS in a paired region. Survives a zone outage and a whole region outage.

**When I'd use it:** Pick based on how critical the files are and what failure they need to survive.

**What confused me:** Nothing yet.

## Storage: SAS links
**What it is:** A signed URL that gives limited, time-limited access to storage without signing in.

**When I'd use it:** Short-term sharing of one file with someone who has no access. Read-only, short expiry, HTTPS only.

**What confused me:** I started on the account-level SAS page, which lets you tick every service and permission and would have given far wider access than I wanted. The blob-level page scopes the link to a single file. A read-only link from there opened fine in a private window.

**Additional notes:** A leaked SAS works for anyone holding the URL, with no sign-in. An ordinary SAS is signed by the account key, so revoking it means rotating the key, which breaks every other SAS made with that key. For important or confidential files I'd use Entra authentication with a data role (e.g. Storage Blob Data Reader). Other safer options are a user delegation SAS (signed with Entra credentials) or a service SAS tied to a stored access policy, which can be revoked by changing the policy.