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