# Manual E2E tests

It's been a [long journey](#timeline) to implement reliable auto-rollback
tests. After almost two years of work, the old-style deploy-triggered Jenkins
tests have been disabled. If you have not yet updated your deploy-triggered
tests to be [helm tests](https://github.com/mulesoft/core-paas-rfc/blob/master/e2e-deprecation.md),
here is how you can continue to run the old-style tests:

1. Change the `deploymentStrategy` in `valkyr.yaml` to `continuous-delivery`.
   (See the [valkyr README](https://github.com/mulesoft/valkyr) for more).
   This will cause the deploy to pause before every restricted environment
   deploy.
1. When the deployment pauses, manually run your e2e test on the previous
   environment. In other words, when the deploy job is paused on the deploy for
   kstg, run your e2e tests for kqa. When it is paused before deploying to
   kprod-eu, run your e2e tests for kstg.
1. If the e2e tests fail, and you wish to prevent the promotion to the next
   env, cancel the deploy instead of approving it, and proceed (as you had to
   before) with manually redeploying the old version to the failed environment.

This process is quite manual, and you are encouraged to upgrade your tests as
soon as possible in order to gain the auto-rollback-on-failure functionality
that the helm tests enable.

## Timeline
- May 2018: working group formed
- Sep 2018: deployer supports running the tests
- Nov 2018: teams encouraged to start implementing tests
- Apr 2019: first helm test goes live in kprod (applause to design-center-projects-service)
- Oct 2019: auto-rollback implemented for helm test failures
- Oct 2019: deprecation of old-style e2e tests officially announced
- Feb 2020: e2e tests officially disabled
