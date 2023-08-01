# Salesforce and Google Analytics 4 Integration

## Prerequisites
Detailed information about installing the prerequisites can be found [here](https://trailhead.salesforce.com/content/learn/projects/quickstart-vscode-salesforce/start-vscode).
- Install VsCode
- Install the Salesforce CLI
- Install the Salesforce Extension Pack

## Install the package
- Clone the project on your local machine. Use the following command: 
    git clone https://github.com/Cloudkettle/Salesforce-GA4-Integration.git
- Authorize the CLI to login to your org where you want to deploy:
    sfdx auth:web:login -s -a "ga-org"
- Deploy the package:
    sfdx force:source:deploy -x ./manifest/package.xml
- Update the api secret and measurement id in the "Google Analytics Measurement Protocol" named credential in your org. Replace the strings in bold:
    https://www.google-analytics.com/mp/collect?api_secret=**add_secret**&measurement_id=**add_measurement_id**
- Assign the "Google Analytics Callout" permission set to the integration user who will be using the invocable action to make the Google Analytics callout.