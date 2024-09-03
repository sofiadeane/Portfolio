# Controls assessment checklist

|  YES |  NO  | Control type                                                         |
|:----:|:----:|:---------------------------------------------------------------------|
|      |   ✘  | Least Privilege                                                      |
|      |   ✘  | Disaster recovery plans                                              |
|      |   ✘  | Password policies                                                    |
|      |   ✘  | Separation of duties                                                 |
|   ✔  |      | Firewall                                                             |
|      |   ✘  | Intrusion detection system (IDS)                                     |
|      |   ✘  | Backups                                                              |
|   ✔  |      | Antivirus software                                                   |
|      |   ✘  | Manual monitoring, maintenance, and intervention for legacy systems  |
|      |   ✘  | Encryption                                                           |
|   ✔  |      | Password management system                                           |
|   ✔  |      | Locks (offices, storefront, warehouse)                               |
|   ✔  |      | Closed-circuit television (CCTV) surveillance                        |
|   ✔  |      | Fire detection/prevention (fire alarm, sprinkler system, etc.)       |

<br>
<br>

# Compliance checklist
#### Payment Card Industry Data Security Standard (PCI DSS)
|  YES |  NO  | Best practice                                                                                                  |
|:----:|:----:|:---------------------------------------------------------------------------------------------------------------|
|      |   ✘  | Only authorized users have access to customers’ credit card information.                                       |
|      |   ✘  | Credit card information is stored, accepted, processed, and transmitted internally, in a secure environment.   |
|      |   ✘  | Implement data encryption procedures to better secure credit card transaction touchpoints and data.            |
|      |   ✘  | Adopt secure password management policies.                                                                     |

#### General Data Protection Regulation (GDPR)                                                        
|  YES |  NO  | Best practice                                                                                                     |
|:----:|:----:|:------------------------------------------------------------------------------------------------------------------|
|      |   ✘  | E.U. customers’ data is kept private/secured.                                                                     |
|   ✔  |      | There is a plan in place to notify E.U. customers within 72 hours if their data is compromised/there is a breach. |
|   ✔  |      | Ensure data is properly classified and inventoried.                                                               |
|   ✔  |      | Enforce privacy policies, procedures, and processes to properly document and maintain data.                       |

#### System and Organizations Controls (SOC type 1, SOC type 2) 
|  YES |  NO  | Best practice                                                                                                     |
|:----:|:----:|:------------------------------------------------------------------------------------------------------------------|
|   ✔  |      | User access policies are established.                                                                             |
|      |   ✘  | Sensitive data (PII/SPII) is confidential/private.                                                                |
|   ✔  |      | Data integrity ensures the data is consistent, complete, accurate, and has been validated.                        |
|   ✔  |      | Data is available to individuals authorized to access it.                                                         |

<br>
<br>
<br>
<br>

# Recommendations

Although all of the missing controls are important and should be addressed eventually, there are eight that need to be prioritized to prevent potential disasters:

| URGENCY LEVEL | CONTROL NAME               | COMMENTS                                                                           |
|:-------------:|:---------------------------|:-----------------------------------------------------------------------------------|
|     High      | Intrusion detection system | Critical for preventing future breaches and detecting ongoing attacks.             |
|     High      | Encryption                 | Critical for reducing the impact of malicious or compromised accounts.             |
|  Medium-high  | Least Privilege            | Essential for protecting against malicious or compromised insider accounts.        | 
|  Medium-high  | Separation of duties       | Important for reducing the impact of malicious or compromised insider accounts.    |
|     Medium    | Password policies          | Necessary to reduce the risk of account compromise.                                |
|      Low      | Disaster recovery plans    | Important for ensuring business continuity in the event of an attack.              |

#### Aditional considerations:
- **Backups:** Regular backups are vital for recovery from data loss incidents, including ransomware. If backups aren't reliable, this might warrant a higher urgency level.
- **Manual Monitoring for Legacy Systems:** If legacy systems are critical to operations, the lack of monitoring and maintenance could be a significant risk, potentially deserving a higher priority.


The lack of policies and compliance with regulations should also be addressed and corrected. As of now (02/09/2024), Botium Toys’ customers’ data is highly exposed and vulnerable. The absence of proper controls and compliance measures means that even a minor breach could have significant consequences, impacting the finances, reputation, and trust of both the company and its customers.

