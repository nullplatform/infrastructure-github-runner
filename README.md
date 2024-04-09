<h2 align="center">
    <a href="https://httpie.io" target="blank_">
        <img height="100" alt="nullplatform" src="https://nullplatform.com/favicon/android-chrome-192x192.png" />
    </a>
    <br>
    <br>
    Nullplatform "GitHub Self Hosted Runner" Template
    <br>
</h2>

This repository contains a template for setting up GitHub self-hosted runners that support multiple architectures.

## What is a GitHub Self Hosted Runner?

GitHub Actions allows you to automate tasks directly in your GitHub repository. Self-hosted runners extend this functionality by allowing you to run workflows on your own infrastructure. This template provides you with a setup for self-hosted runners that can be deployed on various architectures.

## Features

- **Multi-architecture Support:** This template is configured to work on multiple architectures such as x86, ARM, and others.
- **Flexible Deployment:** Easily deploy and manage the self-hosted runners on your infrastructure using nullplatform.

## Getting Started

1. **Create new application based on this repository:** Create a new application in nullplatform using this repository.
2. **Modify configuration:** Customize the runner configuration to match your environment and requirements.
3. **Create required application parameters:** When setting up the self-hosted runner, ensure you have the following parameters ready.
    - **URL:** This is the URL where the runner will be executed, typically `https://github.com/<your_organization>`.
    - **TOKEN:** You'll need a token to register the new runner. Obtain one from `https://github.com/<your_organization>/settings/actions/runners/new`.
    - **NAME (Optional):** You can assign a name to the runner for easy identification.
    - **LABELS (Optional):** Additional labels can be assigned to the runner for categorization and organization purposes.
4. **Deploy the runner:** Deploy the modified self-hosted runner to your infrastructure.
5. **Configure workflows:** Adapt and configure GitHub Actions workflows to leverage your self-hosted runner.

For detailed instructions on setting up and configuring the GitHub self-hosted runners, refer to the [GitHub Actions Runner documentation](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners).

## Resources

- [GitHub Actions Runner Documentation](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub Self-hosted Runners Repository](https://github.com/actions/runner)
