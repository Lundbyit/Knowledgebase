https://learn.microsoft.com/en-us/training/modules/choose-azure-service-to-integrate-and-automate-business-processes/

## Workflows
- Logic Apps
- Microsoft Power Automate
- WebJobs
- Azure Functions

## Logic apps
To build workflows

## Power automate
No developer experience
4 Triggers
* Automated - Events
* Button - click
* Scheduled
* Business process - 

Built on logic apps

## Webjobs
More developer centered
Web application, mobile backends, RestApi. Part of *App services*
- Continuous
- Triggered

## Azure functions
Consumptionplan
Triggers
* Http-Trigger
* TimerTrigger
* BlobTrigger
* CosmosDbTrigger

Choose webjobs over functions when it's suppose to be a part of app service application or you need close control over trigger 

## Conclusions
retries use webjobs(?)
Integrate with external services Logic app if you want to use design first way
