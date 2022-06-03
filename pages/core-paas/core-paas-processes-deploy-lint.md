# Detecting Bugs Automatically

## Motivation

As we've scaled, core-paas has discovered that we needed a better way of
detecting service misconfiguration or other similar issues. We've settled on
the [Open Policy Agent][opa] (OPA), which many other organizations also use for the
same purpose. OPA support has been directly integrated into the deployment
system.

We also discovered we needed a lighter-weight way of notifying you, the
developers, about these issues. We decided to use slack, since most devs are
already using this notification path, and this is already part of the
deployment system.

## What do I need to do?

1. If you haven't already, make sure that your service's slack deployment
   notifications go somewhere you monitor. This channel is configurable via the
   `slackChannel` field in [`valkyr.yaml`][valkyr]; it defaults to
   `${product.name}-bot`.

2. As you deploy, pay attention to any lint notices; they will be attached to
   the deploy notification.

3. Most lint rules we add will begin as non-blocking warnings. If the warning
   is scheduled to become an error, the data of that change will be recorded in
   the warning; this date will generally be 2-3 months from the date the lint
   rule is put into place (depending on the complexity of the fix). Some rules
   may begin as fatal errors, but this will be reserved solely for emergencies.
   (A rule without a date is not currently on track to become fatal).

4. In order to keep up with security-patching your service, you'll need to
   rebuild and redeploy your service at least once per month. If you follow
   this guidance, you will also see new lint messages with plenty of time to
   resolve them before they become blockers.

   **important**: Since service configuration can differ between environments, it
   is also possible for a lint warning to be emitted in one environment but not
   in another. Teams are encouraged to propagte changes to every environment
   their services run in.

5. If you need guidance on how to fix a problem, you should:
    1. Check the README in the [policy subdir of the `product-configs`
       repo][policy]; all rules should be documented there.
    2. `!ask` us in `#core-paas` on slack, we'd be glad to help.

6. If you want to see aggregate information about all services your team is
   responsible for, we push deployment metrics (including lint warnings) to
   New Relic. More docs on this are available [here][events].

## I want to write a new rule!

Contributions welcome! There is a document aimed at rule development in the
[core-paas-client docs][cpc].  All rego policies in the [`policy` subdir of
`product-configs`][policy] will be loaded automatically.

[opa]: https://www.openpolicyagent.org/
[valkyr]: https://github.com/mulesoft/valkyr#usage
[policy]: https://github.com/mulesoft/kilonova-product-configs/tree/master/policy
[cpc]: https://github.com/mulesoft/core-paas-client/blob/master/docs/opa-lint.md
[events]: https://github.com/mulesoft/core-paas-client/blob/master/docs/deploy-events.md#new-relic-insights
