# Creating Dockerfiles

First thing we need to do is make a Dockerfile. A Dockerfile is a text document that contains all
the commands a user would call on the command line to assemble an image. Using `docker build` users
can create an automated build that executes several command-line instructions in succession.

  - [ ] Create a file named `Dockerfile` at the root of your repo.
  - [ ] You can start with this template
    ``` Dockerfile
    # FROM is the Image from which to build on top of. Should use a Core PaaS base image if available.
    FROM <image> as base
    
    # ENV is used to set environment variables. It will be set for ALL steps below this.
    ENV FLAVOR=spicy
    
    # Set user to root when installing packages
    USER root
    RUN apt-get install -y git
    
    # Set user to app for all artifacts to have correct permissions
    USER 2020
    
    # COPY is used to copy files from your repo into the image. You can do this all at once or in parts
    COPY . /app
    
    # We add tests in this build phase. everything in this phase will be removed from final image
    FROM base as test
    
    # RUN is used to run commands inside the build. Each RUN line is run in its own shell
    RUN make test
    
    # This is the final image that will be used. This MUST be a Core PaaS base image.
    FROM base as production
    
    # COPY with --from is used to copy files from an earlier stage to this one
    COPY --from=base ./out /out
    
    # Command that starts your app
    CMD ["npm", "start"]
    ```

## Details

  - `FROM <image> as base`: This line specifies the base image the rest of the image is built from.
    We recommend using a [Core PaaS base
    image](https://github.com/mulesoft?q=base-image). You can also do this from
    the command line using [cpc](https://github.com/mulesoft/core-paas-client).
    
    In general:
    ```bash
    cpc artifacts list docker/<image-name>
    ```

    To get the latest tag of the node-12.16 image in each repo:
    ```bash
    cpc artifacts list -q -o table docker/mulesoft/core-paas-base-image-node-12.16
    ```
    ```console
    DIGEST                                                                     NAME                                                          TAG        TYPE      VERSION
    sha256:78594cc27531446dc0ce0df0f4307e1a5a419980d27bb171a67034b2c640130b    artifacts.msap.io/mulesoft/core-paas-base-image-node-12.16    v3.3.25    docker    3.3.25
    ```

  - `COPY <src>... <dest>`: The `COPY` instruction copies new files, directories or remote file URLs
    from the `<src>` path and adds them to the filesystem of the image at the path `<dest>`. [More
    info on `COPY` statement](https://docs.docker.com/engine/reference/builder/#copy).

  - `RUN <command>`: The `RUN` instruction will execute any commands in a new layer on top of the
    current image and commit the results. The resulting committed image will be used for the next
    step in the Dockerfile. [More info on `RUN`
    statement](https://docs.docker.com/engine/reference/builder/#run).

  - `FROM base as test`: This second `FROM` statement starts a multistage build. It uses `base` to
    build on. Your test should be ran in this phase. Note everything that gets added to the image
    here will / should be removed in the final image. [More on multistage
    builds](https://docs.docker.com/develop/develop-images/multistage-build/).

  - `FROM base as production`: The output of this stage will be the image used in production. It
    should contain only the binary and tools you need in prod. It should be one of the [core-paas
    images](https://github.com/mulesoft?utf8=%E2%9C%93&q=image-base&type=&language=). If you do not
    see the one you need, ping \#core-paas on slack. [More info on `FROM`
    statement](https://docs.docker.com/engine/reference/builder/#from).

  - `COPY --from=<image> <src> <dest>`: This line is used to copy files from the `base` build stage
    to the current stage. [More on `COPY`
    statement](https://docs.docker.com/engine/reference/builder/#copy).

  - `USER 2020`: This line sets the user to one with the UID `2020`; this corresponds to the `app`
    user in the core-paas base images. We use a numeric UID for reasons documented
    [here](../cloud/psp.md). This user should be the user that your app runs with. Only use
    `root` user if *required* to install dependencies. [More on
    `USER`](https://docs.docker.com/engine/reference/builder/#user)

  - `CMD ["command", "arg1", "arg2"]`: *required* This line sets the command (and args) used to run
    your app. [More on `CMD`](https://docs.docker.com/engine/reference/builder/#cmd).

## Making your own

You can craft the `Dockerfile` locally on your machine by running `docker build .` in your repo\!
You can try building it until it passes.

When making your `Dockerfile` ask these questions:

1.  What language is my app and what version do I use?
      - This determines what you should use in your `FROM`.
2.  What are my apps dependencies?
      - Use this information and install them in the `base` stage.
3.  How do I test my app?
      - Use this information to run your test commands in the `test` stage.
4.  What are the minimal files needed to run in production?
      - Use `COPY` in the production stage to only move required files.

## Linting

We use [hadolint](https://github.com/hadolint/hadolint) to lint our Dockerfiles. You can see the
explanations for the rules [here](https://github.com/hadolint/hadolint/wiki).

Run the linter locally like this:

    docker run --rm -i hadolint/hadolint < Dockerfile

there should be 0 errors.

## Best practices

  - Run user as `root` when installing global packages and set back to `2020` as soon as possible.
    This is to ensure all files the application uses are set with the user `2020` permissions.
  - When using `apt` install packages like this:
    ```
    RUN apt-get update \
      && apt-get -y --no-install-recommends install <PACKAGES TO INSTALL> \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*
    ```
  - Ensure your app can run as user `2020` *NOT* user `root`. [More
    info](https://medium.com/@mccode/processes-in-containers-should-not-run-as-root-2feae3f0df3b).
  - Do not override the docker `ENTRYPOINT` of the base image. The Core PaaS base images have the
    docker `ENTRYPOINT` statement needed for running in production. Use the
    docker `CMD` statement instead.
  - [Best practices from
    Docker.com](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/).
  - Define a .dockerignore file in your repository, to avoid bloating your images with undesired files. For example:
    ```
    # Do not include git metadata in the Docker image
    .git/
    # Helm files are not needed in the Docker image
    helm/
    ```
