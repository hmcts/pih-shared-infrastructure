# pih-shared-infrastructure
Shared infrastructure for Publishing and Information Hub

### Structure
This repo follows the pattern established by PlatOps, as documented [here](https://hmcts.github.io/ways-of-working/new-component/infrastructure-as-code.html#infrastructure-as-code).  the components currently defined are

* rg - for bootstrapping resource groups and storage accounts
* apim - apim creation and configurations that fall outside of PIP policies

* environments - standard environment dir structure for use withing Shared Development

* azure_pipeline.yaml - PlatOps Derived ADO pipeline.

Any questions or comments feel free to raise a PR or contact #vh-devops on _slack_
