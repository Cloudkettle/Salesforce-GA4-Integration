# Salesforce and Google Analytics 4 Integration
The Salesforce and Google Analytics 4 (GA4) integration leverages Marketing App Extensions to send offline data to GA4. The setup process involves collecting information to configure the Salesforce-GA4 integration, installing the package in your org, and using External Actions in Engagement Studio programs.

## Getting Started
The package utilizes Salesforce Action Triggers and Invocable Actions to send offline data to GA4. To use this package, you must have experience creating a Marketing App Extension and configuring an External Action for use in Engagement Studio programs or Completion Actions. The documentation on this page provides instructions for deploying the package and utilizing it in Account Engagement. Each section includes additional links to complete the prerequisites for the integration.

### Prerequisites
The integration requires specific permissions and access to multiple platforms. Below is a comprehensive list of prerequisites:
- A Salesforce administrator needs to install the package.
- The "Manage Public List Views" user permission is necessary for a Salesforce Administrator or a designated marketing administrator to access Marketing App Extensions.
- An Account Engagement license and access to an Account Engagement Business Unit are required.
- An Account Engagement Administrator or Marketing role is needed to create and configure Engagement Studio programs and Account Engagement forms.
- Google Analytics 4 Editor access is required to retrieve the Measurement Id and create an API security key for use in the Measurement Protocol. More details on how to retrieve the Measurement Id and API Secret Key, can be found here.
- Website backend access is required to add a JavaScript snippet for retrieving the GA4 Client Id and appending it to forms. For instructions on how to capture the GA4 Client Id on Account Engagement forms, follow the steps described in this article.

## Setup Process
There are two ways to install the package in your organization. Before choosing one of these options, please consult with your Salesforce admin.

### Setup process using the AppExchange installation link (recommended)
To install the package, choose one of the links below depending on your organization's type. You can leave the default options selected (install for admins only). If there are any existing components with the same names as the ones in this package, do not install it.

- [Production](https://login.salesforce.com/packaging/installPackage.apexp?p0=04tHu000003l0v1)
- [Sandbox](https://test.salesforce.com/packaging/installPackage.apexp?p0=04tHu000003l0v1)

### Setup process using the GitHub project (developer friendly)

Detailed information about installing the prerequisites can be found [here](https://trailhead.salesforce.com/content/learn/projects/quickstart-vscode-salesforce/start-vscode).

1. Clone the project on your local machine. Use the following command:

    ```git clone https://github.com/Cloudkettle/Salesforce-GA4-Integration.git```
  
2. Authorize the CLI to login to your org in order to deploy the package components:

    ```sfdx auth:web:login -s -a "ga-org"```
3. Deploy the package:

    ```sfdx force:source:deploy -x ./manifest/package.xml```

### Configure the integration

1. Update the API secret and Measurement ID in the named credential "Google Analytics Measurement Protocol" in your organization.

    ```https://www.google-analytics.com/mp/collect?api_secret=**yourApiSecret**&measurement_id=**yourMeasurementId**```

2. Assign the "**Google Analytics Callout**" permission set to the integration user who will be using the invocable action to make the Google Analytics callout.

3. Navigate to Marketing Setup > Marketing App Extensions to create a new Marketing App Extension. Make sure "**Active in Automations**" is checked.

![New Marketing App Extension](https://info.cloudkettle.com/l/876711/2023-08-29/588b9y/876711/1693338739Jg1aKsWz/ae_Marketing_App_Extension.png&sa=D&source=docs&ust=1693342373600098&usg=AOvVaw1pGQxLDaiauH8h2qqPKIHe)

4. To create an External Action that will appear in the Actions section of the Engagement Studio program, click on **New** in the Action Types section. Then, select "**GAInvocableAction**" in the Invocable Action. Make sure to check "**Active in Automations**".

![Edit Action Type](https://info.cloudkettle.com/l/876711/2023-08-29/588bb2/876711/1693338740u08iZl7z/ae_Action.png)

5. To complete the process, assign the newly created marketing app to a business unit. Under the Business Unit Assignments section, click **New** and select the business unit where you want the External Action to appear.

## Troubleshooting
Please refer to the official [Salesforce help document](https://help.salesforce.com/s/articleView?id=000393472&type=1) for any issues to troubleshoot External Actions.

## Authors
- [Sabuhi Yahyayev](https://www.linkedin.com/in/sabuhiy/)
- [Nicolae Dragu](https://www.linkedin.com/in/nicolae-dragu-12525049/)

## Disclaimer
By installing this unmanaged Salesforce package, you acknowledge and agree that CloudKettle is not responsible for any issues, errors, or disruptions that may arise after the installation of the package. This includes but is not limited to data loss, performance issues, or conflicts with other software. Use this package at your own risk and discretion. CloudKettle makes no warranties, either express or implied, regarding the functionality, reliability, or compatibility of this package with your Salesforce environment. Please proceed with caution and conduct appropriate tests before fully integrating it into your system.


