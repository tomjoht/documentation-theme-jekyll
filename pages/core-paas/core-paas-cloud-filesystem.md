# Container Filesystem

If an application needs to write files inside the container, it will need to create an [`emptyDir` volume](#emptydir-volumes).
However there are [caveats](#caveats) you need to know.

# Caveats

# Files are ephemeral
Files created inside of a container are ephemeral and should not be expected to persist.
If you need persistent storage consider using a database or s3.

# Disk space is shared
The disk usage of files created in containers is shared with all containers running on a node.
Avoid using large amounts of disk. Keep it < 100 mb per container.

# emptyDir Volumes
If you need to write files inside the container they should be written to an `emptyDir` type `Volumes`.

[Click here for more info on Volumes](https://kubernetes.io/docs/concepts/storage/volumes)

[Click here for more info on emptyDir](https://kubernetes.io/docs/concepts/storage/volumes/#emptydir)

## Setup
To setup an `emptyDir` type `Volume` the following must be added to your `deployment`:

Add `volumeMounts` under the container in the `containers` key:
```yaml
...
containers:
  - name: application
    ...
    volumeMounts:
    - mountPath: /scratch
      name: test-volume
```

Add `volumes` under the `spec` key:
```yaml
...
spec:
  ...
  volumes:
  - name: test-volume
    emptyDir: {}
```

With this setup you can write files to `/scratch` directory.
NOTE: You can change `/scratch` to be at any path and any name to suite your needs.
