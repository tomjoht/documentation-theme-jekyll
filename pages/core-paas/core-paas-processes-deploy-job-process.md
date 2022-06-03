# Manual Deploy job Process
Use this process when the deploy job needs to be run manually in the kstg, kprod, or kprod-eu environments.

If your service is on valkyr CI/CD, you are **not** allowed to perform this action without VP approval in a PCCR.
If you need to deploy a specific version you must revert your `master` branch to a working version.

If your service is **not** on valkyr (artifacts are built outside of Core PaaS) use the following process.

### Out Of Window Deploy (com-cloud)
1. The `code-owner` creates a PCCR to run deploy job with values for **all** the parameters.
2. The `code-owner` sends a message in `#pccr-triage` slack channel `@pccr-gatekeeper requesting review for OOW deploy job PR <LINK_TO_PR>`.
3. The `@pccr-gatekeeper` reviews and approves the PCCR.
4. The `@pccr-gatekeeper` finds an `SRE team member` to approve the `deploy` job in Jenkins.
5. The `SRE team member` tells `code-owner` to trigger the `deploy` job.
6. The `code-owner` triggers the `deploy` job with the specified parameters from the PCCR ticket.
7. The `code-owner` validates the diff in the Jenkins console.
8. The `code-owner` sends the link to the `deploy` job to the `SRE team member` for approval.
9. The `SRE team member` clicks approve on the `deploy` job.

### Out Of Window Deploy (gov-cloud)
1. The `code-owner` creates PR to update their version definition in [kilonova-product-configs/channel-gov](https://github.com/mulesoft/kilonova-product-configs/tree/master/channel-gov).
2. The `code-owner` creates a PCCR to run deploy job with values for **all** the parameters.
3. The `code-owner` sends a message in `#pccr-triage` slack channel `@sre-gov requesting review for OOW gov deploy job PR <LINK_TO_PR>`.
4. The `@pccr-gatekeeper` reviews and approves the PCCR.
5. The `@pccr-gatekeeper` finds an `SRE team member` to approve and execute the `deploy` job in Jenkins.
6. The `SRE team member` merges the version update PR.
7. The `SRE team member` triggers the `deploy` job with the specified parameters from the PCCR ticket.
8. The `SRE team member` sends the diff in the Jenkins console to the `code-owner` for validation.
9. The `code-owner` checks the diff and tells the `SRE team member` to continue.
10. The `SRE team member` clicks approve on the `deploy` job.

### Release window deploy

1. Two weeks before release: The `code-owner` finds an `SRE team member` to help with the release.
2. If gov-cloud the `code-owner` creates PR to update their version definition in [kilonova-product-configs/channel-gov](https://github.com/mulesoft/kilonova-product-configs/tree/master/channel-gov).
3. The `code-owner` creates a PCCR to run the deploy job with values for *all* the parameters.
4. The `code-owner` gets the PCCR accepted for the next release.
5. Once accepted, follow the same steps in the [Out Of Window Deploy](#Out_Of_Window_Deploy_(com_cloud)).
