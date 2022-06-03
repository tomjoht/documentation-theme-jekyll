# Life after Core PaaS migration

## Core PaaS Application Development Workflow

### Developing

#### Local dev
When developing the first step should be testing changes on your [local machine with KIND](../running-locally/run-in-kind.md).

#### Branching
Valkyr has special branch conventions.
By default, branches do not get published or deployed.
If you want to build or deploy to lower envs, please refer to our [branching guide](https://github.com/mulesoft/valkyr#branches) to determine how you should name your branch.

#### Feature Flagging
Feature flagging can be done per environment using [kilonova-envs-config](https://github.com/mulesoft/kilonova-envs-config).

#### Merging
All deployable artifacts live on the master branch.
All changes should go through the normal PR request cycle.
The person who created the changes in the PR can **NOT** approve their own PR.


### Deploying
Every merge to master is a deploy event.
Once merged, the code is built, scanned, tested, and deployed to each env one by one.
If the application fails in a certain environment, the root cause must be found within 1 business day or the change should be reverted.

### Reverting
Here are the options for reverting a change.

#### NOTES
* If you made kilonova changes, those changes need to be reverted as well.
* Option #1 should always be used. During a cluster rollover we always deploy from master, if it is not deployable then there will be an outage.

1. Revert the master branch to a working commit. **This is the preferred method**
2. Use the deploy job to deploy a previous version. This method **requires** `PCCR` or an `incident`.
3. File `PCCR` to use `helm revert`.

### Maintaining
Once deployed, the service owners are responsible for maintaining the health of the application.
If things go wrong with the application, the service owners should be paged.
[Learn how to monitor your service in production](../cloud/operational-excellence.md)
