# Report on Incident04

According to the information provided at the briefing, these are the tools I would implement in order to harden the network.

| Tool                 | Reason |
|:--------------------:|:------:|
| Firewall maintenance | Currently, no filters are in place to prevent unauthorized access or protect sensitive data from cyberattacks. |
| Password Management | For the firewall filters to be effective, it is critical that employees can log in only with accounts that match their access levels. Employees with high-level clearance should be required to use Multi-Factor Authentication. |
| Database Password | Default passwords are a significant security risk as they are easy to guess or exploit. |


## Further explanation and details

#### Firewall Maintainance
Currently, no filters are in place to prevent unauthorized access or protect sensitive data from cyberattacks. To address this, protocols should be established to define who can access sensitive Personally Identifiable Information (SPII), under what circumstances, and through which methods. These protocols should adhere to the principle of least privilege, making sure employees only have access to the resources necessary for their roles.

The firewall should then be configured to enforce these protocols, automatically filtering unauthorized access attempts. Regular maintenance of the firewall is essential to ensure its rules reflect the most up-to-date standards for allowed and denied traffic. Suspicious traffic sources should be blocked and placed on a denied list. 

Lastly, firewall rules must be reviewed and updated after any security event, especially if it involves unauthorized network traffic.


#### Password Management 

For the firewall filters to be effective, it is critical that employees can log in only with accounts that match their access levels. Each user should be required to create a unique, strong password on their next login attempt. To further secure accounts, access should be suspended after a predefined number of failed login attempts, reducing the likelihood of successful brute force attacks. 

Employees with high-level clearance should also be required to use Multi-Factor Authentication (MFA), which adds an extra layer of security. MFA not only reduces the risk of unauthorized access but also discourages password sharing, as having the correct password alone is not sufficient for account access. 

These measures can be implemented using the account management system.




#### Database Password 

All default passwords should be changed immediately. It is essential to ensure that no system retains default credentials and that the new database password is as robust as possible. Regular audits should help identify and address any remaining default passwords across systems.

Access to the database should also be carefully monitored and restricted. Sensitive data should be categorized by levels of sensitivity, with higher levels requiring greater privileges and stricter authentication measures to access. 

These steps will ensure that only authorized personnel can access the database, protecting the company’s most critical information.