# Enterprise Enrollment

## Technical Areas
- Departments, accounts and subscriptions
- Enterprise Agreement (EA) portal
- EA role links 

## Design Considerations
- Multiple environments can be seperated at an EA account level to support holistic isolation
- Multiple admins can be appointed to a single enrollment
- Each subscription must have an account owner
- Each account owner will be made subscription owner for any subscriptions provisioned under that account.
- A subscription can belong to only one account. 
- A subscription can be suspended based on a specified set of criteria.

## Design do's
- Map hierachy to organisation structure.
- Use Work/School account
- Assign account owner to subscriptions, one subscription should be assigned to a single account.
- Assign budgets and alerts to each account. 
- Setup a notification contact email, ensure multiple people get notifications.
- Create a new department for IT if business domains have independant IT capabilities.
- Minimise the number of account owners to avoid proliferation of admin accounts to subscriptions.
- Ensure that the account owner is associated with the same tenant as where subscriptions for the account are provisioned.
- Setup enterprise dev/test and production environments at an EA account level to support holistic isolation.
- Do not ignore notification emails
- Do not move or rename an EA account in Azure AD
- Periodically audit access levels in the EA portal


## Design dont's 
- Use Microsoft Accounts (MSA)
